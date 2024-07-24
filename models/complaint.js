const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
    const Complaint = sequelize.define('Complaint', {
        studentId: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'Users', // Nama tabel yang sesuai
                key: 'id'
            }
        },
        title: {
            type: DataTypes.STRING,
            allowNull: false
        },
        description: {
            type: DataTypes.TEXT,
            allowNull: false
        },
        status: {
            type: DataTypes.ENUM('submitted', 'in progress', 'resolved'),
            defaultValue: 'submitted'
        }
    });

    return Complaint;
};
