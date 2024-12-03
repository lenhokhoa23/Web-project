const db = require('../config/db');
const { v4: uuidv4 } = require('uuid');

class Project {
    static getAllProjects(callback) {
        const query = `
            SELECT p.Project_ID, p.ProjectName, p.Address, 
               c.ContractDate, c.ContractDue, c.Customer_ID, 
               cu.CustomerName
            FROM project p
            JOIN contract c ON p.Project_ID = c.Project_ID
            JOIN customer cu ON c.Customer_ID = cu.Customer_ID 
            ORDER BY p.Project_ID ASC
        `;
        
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    static deleteProjectById(projectId, callback) {
        const query = `
            DELETE FROM project 
            WHERE Project_ID = ?;
        `;
    
        db.query(query, [projectId], (err, result) => {
            if (err) {
                return callback(err, null); 
            }
            callback(null, result); 
        });
    }
    
    static getExpireProjects(callback) {
        const query = `
            SELECT p.Project_ID, p.ProjectName, p.Address, 
               c.ContractDate, c.ContractDue, c.Customer_ID, 
               cu.CustomerName
            FROM project p
            JOIN contract c ON p.Project_ID = c.Project_ID
            JOIN customer cu ON c.Customer_ID = cu.Customer_ID
            WHERE c.ContractDue < CURRENT_DATE()
        `
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }


    static addNewProject(projectData, callback) {
        const { ProjectName, Address, ContractDate, ContractDue, Customer_ID } = projectData;
    
        db.beginTransaction((err) => {
            if (err) {
                console.error('Lỗi khi bắt đầu giao dịch:', err);
                return callback(err, null);
            }
    
            const findNextProjectIdQuery = `
                SELECT COALESCE(MAX(Project_ID), 0) + 1 AS next_id FROM project
            `;
            
            db.query(findNextProjectIdQuery, (err, rows) => {
                if (err) {
                    console.error('Lỗi khi tìm ID tiếp theo cho dự án:', err);
                    return db.rollback(() => callback(err, null));
                }
    
                const nextProjectId = rows[0].next_id;
    
                const insertProjectQuery = `
                    INSERT INTO project (Project_ID, ProjectName, Address) VALUES (?, ?, ?);
                `;
                
                db.query(insertProjectQuery, [nextProjectId, ProjectName, Address], (err, result) => {
                    if (err) {
                        console.error('Lỗi khi thêm dự án vào bảng project:', err);
                        return db.rollback(() => callback(err, null));
                    }
    
                    const findNextContractIdQuery = `
                        SELECT COALESCE(MAX(Contract_ID), 0) + 1 AS next_id FROM contract
                    `;
    
                    db.query(findNextContractIdQuery, (err, rows) => {
                        if (err) {
                            console.error('Lỗi khi tìm ID tiếp theo cho hợp đồng:', err);
                            return db.rollback(() => callback(err, null));
                        }
    
                        const nextContractId = rows[0].next_id;
                        const insertContractQuery = `
                            INSERT INTO contract (Contract_ID, Project_ID, ContractDate, ContractDue, Customer_ID) 
                            VALUES (?, ?, ?, ?, ?);
                        `;
    
                        db.query(insertContractQuery, [nextContractId, nextProjectId, ContractDate, ContractDue, Customer_ID], (err, result) => {
                            if (err) {
                                console.error('Lỗi khi thêm hợp đồng vào bảng contract:', err);
                                return db.rollback(() => callback(err, null));
                            }
    
                            db.commit((err) => {
                                if (err) {
                                    console.error('Lỗi khi commit giao dịch:', err);
                                    return db.rollback(() => callback(err, null));
                                }
                                callback(null, { projectId: nextProjectId, contractId: nextContractId });
                            });
                        });
                    });
                });
            });
        });
    }
}

module.exports = Project;