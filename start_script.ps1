# Ensure that script execution is enabled
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Step 1: Install Backend Dependencies
Write-Host "Installing backend dependencies..."
cd Data_Visualization_Project_Backend\code
pip install -r requirements.txt
pip install --user flask
pip install --user flask_cors
pip install --user pandas

# Step 2: Start Backend (Flask) Server in a New Terminal
Write-Host "Starting Flask backend..."
Start-Process powershell -ArgumentList "python app.py" -NoNewWindow

# Step 3: Install Frontend Dependencies
Write-Host "Installing frontend dependencies..."
cd ../../Data_Visualization_Project_Frontend/db_data_project/my-vite-app
npm install
npm install react
npm install react-table
npm install react-router-dom@5
npm install axios
npm install papaparse

# Step 4: Start Frontend (Vite) Server in a New Terminal (no wait)
Write-Host "Starting Vite frontend..."
Start-Process powershell -ArgumentList "npm run dev" -NoNewWindow

# Step 5: Pause for the frontend to start (adjust this if needed)
# Start-Sleep -Seconds 5

# Step 6: Open the Vite frontend in the browser by checking the localhost output
Write-Host "Opening Vite frontend in the browser..."

# Default port for Vite is typically 5173, you can adjust this based on your Vite config
$port = 5173
$url = "http://localhost:$port"

# Open the URL in the default browser
Invoke-Expression "start $url"

Write-Host "All servers started. You can now interact with the application."
pause
