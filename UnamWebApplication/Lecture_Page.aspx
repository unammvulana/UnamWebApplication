<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lecture_Page.aspx.cs" Inherits="UnamWebApplication.Lecture_Page" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .lecture-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .form-section, .status-section {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .section-title {
            color: #2c3e50;
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 25px;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 8px;
        }
        
        .form-control {
            border: 2px solid #e9ecef;
            border-radius: 8px;
            padding: 12px 15px;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
        }
        
        .textarea-control {
            min-height: 120px;
            resize: vertical;
        }
        
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
        
        .btn-delete {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin: 2px;
            cursor: pointer;
            font-size: 0.85rem;
        }
        
        .btn-lecture:hover, .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
            color: white;
            text-decoration: none;
        }
        
        .status-badge {
            padding: 8px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
        }
        
        .status-pending { background: #fff3cd; color: #856404; }
        .status-approved { background: #d4edda; color: #155724; }
        .status-rejected { background: #f8d7da; color: #721c24; }
        .status-recommended { background: #d1ecf1; color: #0c5460; }
        .status-notrecommended { background: #f5e6cc; color: #8a6d3b; }
        
        .table-container {
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            max-height: 600px;
            overflow-y: auto;
        }
        
        .table {
            width: 100%;
            margin-bottom: 0;
            table-layout: auto;
        }
        
        .table th {
            background: linear-gradient(45deg, #3498db, #2980b9);
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
        }
        
        .alert-message {
            padding: 15px;
            border-radius: 8px;
            margin: 15px 0;
            display: none;
            animation: slideIn 0.5s ease-out;
        }
        
        @keyframes slideIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        
        .submission-success {
            background: linear-gradient(45deg, #27ae60, #2ecc71);
            color: white;
            padding: 25px;
            border-radius: 10px;
            text-align: center;
            margin: 20px 0;
            display: none;
            animation: fadeIn 0.5s ease-in;
            box-shadow: 0 5px 20px rgba(39, 174, 96, 0.3);
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .currency-symbol {
            position: relative;
        }
        
        .currency-symbol::before {
            content: "R";
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
            font-weight: 600;
            z-index: 10;
        }
        
        .currency-input {
            padding-left: 30px !important;
        }
        
        .description-text {
            white-space: normal;
            word-wrap: break-word;
            max-width: 200px;
            margin: 0 auto;
        }
        
        /* Custom scrollbar styling */
        .table-container::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }
        
        .table-container::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 4px;
        }
        
        .table-container::-webkit-scrollbar-thumb {
            background: #c1c1c1;
            border-radius: 4px;
        }
        
        .table-container::-webkit-scrollbar-thumb:hover {
            background: #a8a8a8;
        }
    </style>

    <div class="lecture-container">
        <!-- LED Welcome Banner -->
        <div class="led-container">
            <div class="led-welcome">✨ Welcome Lecturer ✨</div>
        </div>

        <!-- Alert Messages -->
        <div id="alertMessage" class="alert-message"></div>

        <!-- Submission Success Message -->
        <div id="submissionSuccess" class="submission-success">
            <h4><i class="fas fa-check-circle"></i> Claim Submitted Successfully!</h4>
            <p>Your claim has been submitted to the Programme Coordinator for review.</p>
            <p><strong>Claim ID: <span id="successClaimId"></span></strong></p>
            <p>You can track the status of your claim in the "My Claim Status" section below.</p>
        </div>

        <!-- Claim Submission Form -->
        <div class="form-section">
            <h3 class="section-title">Submit New Claim</h3>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Full Name *</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter full name"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Surname *</label>
                        <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" placeholder="Enter surname"></asp:TextBox>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Employee ID *</label>
                        <asp:TextBox ID="txtEmployeeID" runat="server" CssClass="form-control" placeholder="Enter employee ID"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Module Code *</label>
                        <asp:TextBox ID="txtModuleCode" runat="server" CssClass="form-control" placeholder="Enter module code"></asp:TextBox>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Programme *</label>
                        <asp:DropDownList ID="ddlProgramme" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">Select Programme</asp:ListItem>
                            <asp:ListItem Value="Computer Science">Computer Science</asp:ListItem>
                            <asp:ListItem Value="Information Technology">Information Technology</asp:ListItem>
                            <asp:ListItem Value="Software Engineering">Software Engineering</asp:ListItem>
                            <asp:ListItem Value="Data Science">Data Science</asp:ListItem>
                            <asp:ListItem Value="Cyber Security">Cyber Security</asp:ListItem>
                            <asp:ListItem Value="Business Computing">Business Computing</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Claim Date *</label>
                        <asp:TextBox ID="txtClaimDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="form-label">Hours Worked *</label>
                        <asp:TextBox ID="txtHoursWorked" runat="server" CssClass="form-control" TextMode="Number" step="0.5" placeholder="0.0" onchange="calculateTotal()"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group currency-symbol">
                        <label class="form-label">Hourly Rate (R) *</label>
                        <asp:TextBox ID="txtHourlyRate" runat="server" CssClass="form-control currency-input" TextMode="Number" step="0.01" placeholder="0.00" onchange="calculateTotal()"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group currency-symbol">
                        <label class="form-label">Total Amount (R)</label>
                        <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="form-control currency-input" ReadOnly="true" BackColor="#f8f9fa"></asp:TextBox>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label class="form-label">Description *</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control textarea-control" TextMode="MultiLine" 
                    placeholder="Please provide a detailed description of the work performed, including specific tasks, deliverables, and any other relevant information that will help in the review process."></asp:TextBox>
                <small class="form-text text-muted">Provide a detailed description of the work performed to assist in the review process.</small>
            </div>
            
            <div class="form-group">
                <label class="form-label">Supporting Documents</label>
                <asp:FileUpload ID="fileDocuments" runat="server" CssClass="form-control" />
                <small class="form-text text-muted">Upload relevant supporting documents (PDF, DOC, JPEG, PNG) - Maximum file size: 10MB</small>
            </div>
            
            <div class="text-center">
                <button type="button" id="btnSubmitClaim" class="btn-lecture" onclick="submitClaim()">Submit Claim</button>
                <asp:HyperLink ID="btnBack" runat="server" Text="Back to Home" CssClass="btn-lecture" NavigateUrl="~/Default.aspx" />
            </div>
        </div>

        <!-- Claim Status Section -->
        <div class="status-section">
            <h3 class="section-title">My Claim Status</h3>
            <div class="table-container">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Claim ID</th>
                            <th>Module Code</th>
                            <th>Programme</th>
                            <th>Date</th>
                            <th>Total Amount</th>
                            <th>Documents</th>
                            <th>Coordinator Recommendation</th>
                            <th>Manager Final Status</th>
                            <th class="action-cell">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="claimStatusBody">
                        <tr>
                            <td colspan="9" class="text-center">No claims submitted yet.</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        // Global variables to track claims
        var allClaims = JSON.parse(localStorage.getItem('lecturerClaims')) || [];
        var coordinatorClaims = JSON.parse(localStorage.getItem('coordinatorClaims')) || [];
        var managerClaims = JSON.parse(localStorage.getItem('managerClaims')) || [];

        function calculateTotal() {
            var hours = parseFloat(document.getElementById('<%= txtHoursWorked.ClientID %>').value) || 0;
            var rate = parseFloat(document.getElementById('<%= txtHourlyRate.ClientID %>').value) || 0;
            var total = hours * rate;
            document.getElementById('<%= txtTotalAmount.ClientID %>').value = total.toFixed(2);
        }

        function showAlert(message, type) {
            var alertDiv = document.getElementById('alertMessage');
            alertDiv.innerHTML = message;
            alertDiv.className = 'alert-message alert-' + type;
            alertDiv.style.display = 'block';

            setTimeout(function () {
                alertDiv.style.display = 'none';
            }, 12000); // 12 seconds
        }

        function showSuccessMessage(claimId) {
            document.getElementById('successClaimId').textContent = claimId;
            document.getElementById('submissionSuccess').style.display = 'block';

            setTimeout(function () {
                document.getElementById('submissionSuccess').style.display = 'none';
            }, 12000); // 12 seconds
        }

        function submitClaim() {
            var fullName = document.getElementById('<%= txtFullName.ClientID %>').value.trim();
            var surname = document.getElementById('<%= txtSurname.ClientID %>').value.trim();
            var employeeID = document.getElementById('<%= txtEmployeeID.ClientID %>').value.trim();
            var moduleCode = document.getElementById('<%= txtModuleCode.ClientID %>').value.trim();
            var programme = document.getElementById('<%= ddlProgramme.ClientID %>').value;
            var claimDate = document.getElementById('<%= txtClaimDate.ClientID %>').value;
            var hours = document.getElementById('<%= txtHoursWorked.ClientID %>').value;
            var rate = document.getElementById('<%= txtHourlyRate.ClientID %>').value;
            var description = document.getElementById('<%= txtDescription.ClientID %>').value.trim();
            var total = document.getElementById('<%= txtTotalAmount.ClientID %>').value;

            // Validation
            if (!fullName || !surname || !employeeID || !moduleCode || !programme || !claimDate || !hours || !rate || !description) {
                showAlert('Please fill in all required fields marked with *.', 'error');
                return;
            }

            if (parseFloat(hours) <= 0 || parseFloat(rate) <= 0) {
                showAlert('Hours worked and hourly rate must be greater than zero.', 'error');
                return;
            }

            if (description.length < 10) {
                showAlert('Please provide a more detailed description (minimum 10 characters).', 'error');
                return;
            }

            // Generate unique claim ID
            var claimId = 'CLM-' + Date.now();
            var formattedDate = new Date(claimDate).toLocaleDateString('en-GB');

            // Create claim object
            var claimData = {
                claimId: claimId,
                fullName: fullName,
                surname: surname,
                employeeID: employeeID,
                moduleCode: moduleCode,
                programme: programme,
                date: formattedDate,
                hours: hours,
                hourlyRate: parseFloat(rate).toFixed(2),
                totalAmount: total,
                description: description,
                coordinatorRecommendation: 'Pending',
                managerFinalStatus: 'Pending',
                timestamp: new Date().getTime()
            };

            // Add to lecturer's claims
            allClaims.push(claimData);
            localStorage.setItem('lecturerClaims', JSON.stringify(allClaims));

            // Add to coordinator's queue
            coordinatorClaims.push({...claimData});
            localStorage.setItem('coordinatorClaims', JSON.stringify(coordinatorClaims));

            // Update UI
            updateClaimStatusTable();
            showSuccessMessage(claimId);
            
            // Clear form
            document.getElementById('<%= txtFullName.ClientID %>').value = '';
            document.getElementById('<%= txtSurname.ClientID %>').value = '';
            document.getElementById('<%= txtEmployeeID.ClientID %>').value = '';
            document.getElementById('<%= txtModuleCode.ClientID %>').value = '';
            document.getElementById('<%= ddlProgramme.ClientID %>').value = '';
            document.getElementById('<%= txtHoursWorked.ClientID %>').value = '';
            document.getElementById('<%= txtHourlyRate.ClientID %>').value = '';
            document.getElementById('<%= txtTotalAmount.ClientID %>').value = '';
            document.getElementById('<%= txtDescription.ClientID %>').value = '';
            document.getElementById('<%= fileDocuments.ClientID %>').value = '';
        }

        function updateClaimStatusTable() {
            var tbody = document.getElementById('claimStatusBody');
            
            if (allClaims.length === 0) {
                tbody.innerHTML = '<tr><td colspan="9" class="text-center">No claims submitted yet.</td></tr>';
                return;
            }

            var html = '';
            allClaims.forEach(function(claim) {
                // Determine coordinator recommendation status class
                var coordinatorClass = 'status-pending';
                if (claim.coordinatorRecommendation === 'Recommended') {
                    coordinatorClass = 'status-recommended';
                } else if (claim.coordinatorRecommendation === 'Not Recommended') {
                    coordinatorClass = 'status-notrecommended';
                }
                
                // Determine manager final status class
                var managerClass = 'status-pending';
                if (claim.managerFinalStatus === 'Approved') {
                    managerClass = 'status-approved';
                } else if (claim.managerFinalStatus === 'Rejected') {
                    managerClass = 'status-rejected';
                }
                
                html += `
                    <tr>
                        <td>${claim.claimId}</td>
                        <td>${claim.moduleCode}</td>
                        <td>${claim.programme}</td>
                        <td>${claim.date}</td>
                        <td>R${claim.totalAmount}</td>
                        <td><span class="btn btn-sm btn-outline-primary">View</span></td>
                        <td><span class="status-badge ${coordinatorClass}">${claim.coordinatorRecommendation}</span></td>
                        <td><span class="status-badge ${managerClass}">${claim.managerFinalStatus}</span></td>
                        <td class="action-cell">
                            <button class="btn-delete" onclick="deleteClaim('${claim.claimId}')">🗑️ Delete</button>
                        </td>
                    </tr>
                `;
            });
            
            tbody.innerHTML = html;
        }

        function deleteClaim(claimId) {
            if (confirm('Are you sure you want to delete this claim? This action cannot be undone.')) {
                // Remove from lecturer claims
                allClaims = allClaims.filter(claim => claim.claimId !== claimId);
                localStorage.setItem('lecturerClaims', JSON.stringify(allClaims));

                // Remove from coordinator claims
                coordinatorClaims = coordinatorClaims.filter(claim => claim.claimId !== claimId);
                localStorage.setItem('coordinatorClaims', JSON.stringify(coordinatorClaims));

                // Remove from manager claims
                managerClaims = managerClaims.filter(claim => claim.claimId !== claimId);
                localStorage.setItem('managerClaims', JSON.stringify(managerClaims));

                updateClaimStatusTable();
                showAlert('Claim ' + claimId + ' has been deleted successfully!', 'success');
            }
        }

        // Check for status updates every 2 seconds
        function checkForUpdates() {
            var storedLecturerClaims = JSON.parse(localStorage.getItem('lecturerClaims')) || [];
            if (JSON.stringify(storedLecturerClaims) !== JSON.stringify(allClaims)) {
                allClaims = storedLecturerClaims;
                updateClaimStatusTable();
            }
        }

        // Set current date as default and initialize
        window.onload = function() {
            var today = new Date().toISOString().split('T')[0];
            document.getElementById('<%= txtClaimDate.ClientID %>').value = today;

            updateClaimStatusTable();
            setInterval(checkForUpdates, 2000);
        }
    </script>
</asp:Content>