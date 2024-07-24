// models/response.js
const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
    const Response = sequelize.define('Response', {
        complaintId: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'Complaints', // Nama tabel yang sesuai
                key: 'id'
            }
        },
        responseText: {
            type: DataTypes.TEXT,
            allowNull: false
        },
        staffId: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'Users', // Nama tabel yang sesuai
                key: 'id'
            }
        }
    });

    return Response;
};
