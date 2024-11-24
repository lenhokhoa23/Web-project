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
    
        // Tìm ID tiếp theo cho Project_ID
        const findNextProjectIdQuery = `
            SELECT t1.Project_ID + 1 AS next_id
            FROM project t1
            LEFT JOIN project t2 ON t1.Project_ID + 1 = t2.Project_ID
            WHERE t2.Project_ID IS NULL
            ORDER BY t1.Project_ID DESC
            LIMIT 1;
        `;
        
        db.query(findNextProjectIdQuery, (err, rows) => {
            if (err) {
                console.error('Lỗi khi tìm ID tiếp theo cho dự án:', err);
                return callback(err, null);
            }
    
            // Nếu không tìm thấy ID tiếp theo, ta sử dụng MAX(Project_ID) + 1
            let nextProjectId = rows.length > 0 ? rows[0].next_id : 1; // Nếu không có ID trống, gán là 1
    
            // Thêm dự án vào bảng project với Project_ID mới
            const query = `
                INSERT INTO project (Project_ID, ProjectName, Address) VALUES (?, ?, ?);
            `;
            
            db.query(query, [nextProjectId, ProjectName, Address], (err, result) => {
                if (err) {
                    console.error('Lỗi khi thêm dự án vào bảng project:', err); // Log chi tiết lỗi
                    return callback(err, null);
                }
    
                const projectId = result.insertId;
    
                // Tìm ID tiếp theo cho Contract_ID
                const findNextContractIdQuery = `
                    SELECT t1.Contract_ID + 1 AS next_id
                    FROM contract t1
                    LEFT JOIN contract t2 ON t1.Contract_ID + 1 = t2.Contract_ID
                    WHERE t2.Contract_ID IS NULL
                    ORDER BY t1.Contract_ID DESC
                    LIMIT 1;
                `;
    
                db.query(findNextContractIdQuery, (err, rows) => {
                    if (err) {
                        console.error('Lỗi khi tìm ID tiếp theo cho hợp đồng:', err);
                        return callback(err, null);
                    }
    
                    // Nếu không tìm thấy ID tiếp theo, ta sử dụng MAX(Contract_ID) + 1
                    let nextContractId = rows.length > 0 ? rows[0].next_id : 1; // Nếu không có ID trống, gán là 1
    
                    // Thêm hợp đồng vào bảng contract với Contract_ID và Project_ID mới
                    const contractQuery = `
                        INSERT INTO contract (Contract_ID, Project_ID, ContractDate, ContractDue, Customer_ID) 
                        VALUES (?, ?, ?, ?, ?);
                    `;
    
                    db.query(contractQuery, [nextContractId, projectId, ContractDate, ContractDue, Customer_ID], (err, result) => {
                        if (err) {
                            console.error('Lỗi khi thêm hợp đồng vào bảng contract:', err); // Log chi tiết lỗi
                            return callback(err, null);
                        }
    
                        // Trả kết quả về sau khi cả dự án và hợp đồng đã được thêm thành công
                        callback(null, result);
                    });
                });
            });
        });
    }
    
}

module.exports = Project;