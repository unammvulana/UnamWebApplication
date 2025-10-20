<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Programme-CO-Ordinator Page.aspx.cs" Inherits="UnamWebApplication.Programme_CO_Ordinator_Page" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .coordinator-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .claims-section {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .section-title {
            color: #2c3e50;
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 25px;
            border-bottom: 3px solid #e74c3c;
            padding-bottom: 10px;
        }
        
        .btn-coordinator {
            padding: 10px 16px;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin: 2px;
            cursor: pointer;
            font-size: 0.9rem;
            white-space: nowrap;
        }
        
        .btn-recommend { background: #27ae60; color: white; }
        .btn-not-recommend { background: #e74c3c; color: white; }
        .btn-export { background: #9b59b6; color: white; padding: 12px 24px; font-size: 1rem; }
        
        .btn-coordinator:hover {
            transform: translateY(-1px);
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
        }
        
        .table-container {
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            max-height: 600px;
            overflow: auto;
        }
        
        .table {
            width: 100%;
            margin-bottom: 0;
            table-layout: auto;
            min-width: 1200px;
        }
        
        .table th {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
            border: none;
            padding: 15px 12px;
            font-weight: 600;
            position: sticky;
            top: 0;
            z-index: 10;
            white-space: nowrap;
            text-align: center;
        }
        
        .table td {
            padding: 12px;
            vertical-align: middle;
            border-color: #e9ecef;
            white-space: nowrap;
            text-align: center;
        }
        
        .action-cell {
            white-space: nowrap;
            position: sticky;
            right: 0;
            background: inherit;
            z-index: 5;
        }
        
        .status-badge {
            padding: 8px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
        }
        
        .status-pending { background: #fff3cd; color: #856404; }
        .status-recommended { background: #d1ecf1; color: #0c5460; }
        .status-notrecommended { background: #f5e6cc; color: #8a6d3b; }
        
        .btn-lecture {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-lecture:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
            color: white;
            text-decoration: none;
        }
        
        .alert-message {
            padding: 15px;
            border-radius: 8px;
            margin: 15px 0;
            display: none;
            animation: slideIn 0.5s ease-out;
        }
        
        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .empty-state {
            text-align: center;
            padding: 40px;
            color: #6c757d;
        }
        
        .empty-state i {
            font-size: 3rem;
            margin-bottom: 15px;
            opacity: 0.5;
        }
        
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        
        .description-text {
            white-space: normal;
            word-wrap: break-word;
            max-width: 200px;
            margin: 0 auto;
            line-height: 1.4;
        }
        
        /* Professional scrollbar styling */
        .table-container::-webkit-scrollbar {
            width: 12px;
            height: 12px;
        }
        
        .table-container::-webkit-scrollbar-track {
            background: #f8f9fa;
            border-radius: 6px;
        }
        
        .table-container::-webkit-scrollbar-thumb {
            background: #e74c3c;
            border-radius: 6px;
            border: 2px solid #f8f9fa;
        }
        
        .table-container::-webkit-scrollbar-thumb:hover {
            background: #c0392b;
        }
        
        .table-container::-webkit-scrollbar-corner {
            background: #f8f9fa;
        }
        
        /* Action buttons container */
        .action-buttons-container {
            display: flex;
            flex-wrap: nowrap;
            gap: 8px;
            justify-content: center;
        }
        
        /* Ensure table is fully visible with scroll */
        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }
    </style>

    <div class="coordinator-container">
        <!-- LED Welcome Banner -->
        <div class="led-container">
            <div class="led-welcome">🌈 Welcome Programme-Co-Ordinator 🌈</div>
        </div>

        <!-- Alert Messages -->
        <div id="alertMessage" class="alert-message"></div>

        <!-- Claims Review Section -->
        <div class="claims-section">
            <div class="section-header">
                <h3 class="section-title">Claims for Recommendation</h3>
                <div class="action-buttons">
                    <button class="btn-coordinator btn-export" onclick="exportToExcel()">
                        📊 Export to Excel
                    </button>
                </div>
            </div>
            <div class="table-wrapper">
                <div class="table-container">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Claim ID</th>
                                <th>Name</th>
                                <th>Surname</th>
                                <th>Employee ID</th>
                                <th>Module Code</th>
                                <th>Programme</th>
                                <th>Date</th>
                                <th>Hours</th>
                                <th>Hourly Rate</th>
                                <th>Total Amount</th>
                                <th>Status</th>
                                <th>Description</th>
                                <th class="action-cell">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="coordinatorClaimsBody">
                            <tr>
                                <td colspan="13" class="empty-state">
                                    <div>
                                        <i>📋</i>
                                        <h4>No Claims Available</h4>
                                        <p>There are no claims from lecturers at the moment.</p>
                                        <p>New claims from lecturers will appear here automatically.</p>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="text-center mt-4">
                <asp:HyperLink ID="btnBackCoordinator" runat="server" Text="Back to Home" CssClass="btn-lecture" NavigateUrl="~/Default.aspx" />
            </div>
        </div>
    </div>

    <script>
        var coordinatorClaims = JSON.parse(localStorage.getItem('coordinatorClaims')) || [];
        var managerClaims = JSON.parse(localStorage.getItem('managerClaims')) || [];
        var lecturerClaims = JSON.parse(localStorage.getItem('lecturerClaims')) || [];

        function showAlert(message, type) {
            var alertDiv = document.getElementById('alertMessage');
            alertDiv.innerHTML = message;
            alertDiv.className = 'alert-message alert-' + type;
            alertDiv.style.display = 'block';

            setTimeout(function () {
                alertDiv.style.display = 'none';
            }, 12000); // 12 seconds
        }

        function updateCoordinatorTable() {
            var tbody = document.getElementById('coordinatorClaimsBody');

            // Show ALL claims (both pending and decided)
            if (coordinatorClaims.length === 0) {
                tbody.innerHTML = `
                    <tr>
                        <td colspan="13" class="empty-state">
                            <div>
                                <i>📋</i>
                                <h4>No Claims Available</h4>
                                <p>There are no claims from lecturers at the moment.</p>
                                <p>New claims from lecturers will appear here automatically.</p>
                            </div>
                        </td>
                    </tr>
                `;
                return;
            }

            var html = '';
            coordinatorClaims.forEach(function (claim) {
                var statusClass = 'status-pending';
                if (claim.coordinatorRecommendation === 'Recommended') {
                    statusClass = 'status-recommended';
                } else if (claim.coordinatorRecommendation === 'Not Recommended') {
                    statusClass = 'status-notrecommended';
                }

                // Action buttons - NO EDIT BUTTON
                var actionButtons = `
                    <div class="action-buttons-container">
                        <button class="btn-coordinator btn-recommend" onclick="recommendClaim('${claim.claimId}')">✅ Recommend</button>
                        <button class="btn-coordinator btn-not-recommend" onclick="notRecommendClaim('${claim.claimId}')">❌ Not Recommend</button>
                    </div>
                `;

                html += `
                    <tr>
                        <td>${claim.claimId}</td>
                        <td>${claim.fullName}</td>
                        <td>${claim.surname}</td>
                        <td>${claim.employeeID}</td>
                        <td>${claim.moduleCode}</td>
                        <td>${claim.programme}</td>
                        <td>${claim.date}</td>
                        <td>${claim.hours}</td>
                        <td>R${claim.hourlyRate}</td>
                        <td>R${claim.totalAmount}</td>
                        <td><span class="status-badge ${statusClass}">${claim.coordinatorRecommendation}</span></td>
                        <td>
                            <div class="description-text" title="${claim.description || 'No description provided'}">
                                ${claim.description || 'No description provided'}
                            </div>
                        </td>
                        <td class="action-cell">
                            ${actionButtons}
                        </td>
                    </tr>
                `;
            });

            tbody.innerHTML = html;
        }

        function recommendClaim(claimId) {
            // Update coordinator claims
            coordinatorClaims = coordinatorClaims.map(claim => {
                if (claim.claimId === claimId) {
                    claim.coordinatorRecommendation = 'Recommended';
                }
                return claim;
            });
            localStorage.setItem('coordinatorClaims', JSON.stringify(coordinatorClaims));

            // Update lecturer claims
            lecturerClaims = lecturerClaims.map(claim => {
                if (claim.claimId === claimId) {
                    claim.coordinatorRecommendation = 'Recommended';
                }
                return claim;
            });
            localStorage.setItem('lecturerClaims', JSON.stringify(lecturerClaims));

            // Add to manager queue (ALL claims go to manager for final decision)
            var recommendedClaim = coordinatorClaims.find(claim => claim.claimId === claimId);
            if (recommendedClaim) {
                var existingInManager = managerClaims.find(claim => claim.claimId === claimId);
                if (!existingInManager) {
                    managerClaims.push({ ...recommendedClaim });
                    localStorage.setItem('managerClaims', JSON.stringify(managerClaims));
                } else {
                    // Update existing manager claim
                    managerClaims = managerClaims.map(claim => {
                        if (claim.claimId === claimId) {
                            claim.coordinatorRecommendation = 'Recommended';
                        }
                        return claim;
                    });
                    localStorage.setItem('managerClaims', JSON.stringify(managerClaims));
                }
            }

            showAlert('Claim ' + claimId + ' has been recommended and forwarded to Academic Manager for final decision!', 'success');
            updateCoordinatorTable();
        }

        function notRecommendClaim(claimId) {
            // Update coordinator claims
            coordinatorClaims = coordinatorClaims.map(claim => {
                if (claim.claimId === claimId) {
                    claim.coordinatorRecommendation = 'Not Recommended';
                }
                return claim;
            });
            localStorage.setItem('coordinatorClaims', JSON.stringify(coordinatorClaims));

            // Update lecturer claims
            lecturerClaims = lecturerClaims.map(claim => {
                if (claim.claimId === claimId) {
                    claim.coordinatorRecommendation = 'Not Recommended';
                }
                return claim;
            });
            localStorage.setItem('lecturerClaims', JSON.stringify(lecturerClaims));

            // Add to manager queue (ALL claims go to manager for final decision)
            var notRecommendedClaim = coordinatorClaims.find(claim => claim.claimId === claimId);
            if (notRecommendedClaim) {
                var existingInManager = managerClaims.find(claim => claim.claimId === claimId);
                if (!existingInManager) {
                    managerClaims.push({ ...notRecommendedClaim });
                    localStorage.setItem('managerClaims', JSON.stringify(managerClaims));
                } else {
                    // Update existing manager claim
                    managerClaims = managerClaims.map(claim => {
                        if (claim.claimId === claimId) {
                            claim.coordinatorRecommendation = 'Not Recommended';
                        }
                        return claim;
                    });
                    localStorage.setItem('managerClaims', JSON.stringify(managerClaims));
                }
            }

            showAlert('Claim ' + claimId + ' has been marked as Not Recommended and forwarded to Academic Manager for final decision!', 'success');
            updateCoordinatorTable();
        }

        function exportToExcel() {
            if (coordinatorClaims.length === 0) {
                showAlert('No data available to export.', 'error');
                return;
            }

            // Create CSV content
            var csvContent = "Claim ID,Name,Surname,Employee ID,Module Code,Programme,Date,Hours,Hourly Rate,Total Amount,Status,Description\n";

            coordinatorClaims.forEach(function (claim) {
                csvContent += `"${claim.claimId}","${claim.fullName}","${claim.surname}","${claim.employeeID}","${claim.moduleCode}","${claim.programme}","${claim.date}","${claim.hours}","R${claim.hourlyRate}","R${claim.totalAmount}","${claim.coordinatorRecommendation}","${claim.description.replace(/"/g, '""')}"\n`;
            });

            // Create and download file
            var blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
            var link = document.createElement("a");
            var url = URL.createObjectURL(blob);
            link.setAttribute("href", url);
            link.setAttribute("download", "coordinator_claims_" + new Date().toISOString().split('T')[0] + ".csv");
            link.style.visibility = 'hidden';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);

            showAlert('Claims data exported to Excel successfully!', 'success');
        }

        // Check for new claims every 2 seconds
        function checkForNewClaims() {
            var storedClaims = JSON.parse(localStorage.getItem('coordinatorClaims')) || [];
            if (JSON.stringify(storedClaims) !== JSON.stringify(coordinatorClaims)) {
                coordinatorClaims = storedClaims;
                updateCoordinatorTable();
            }
        }

        // Initialize
        window.onload = function () {
            updateCoordinatorTable();
            setInterval(checkForNewClaims, 2000);
        }
    </script>
</asp:Content>