$pdfApps = @{
    SumatraPDF = "C:\Users\{USERNAME}\AppData\Local\SumatraPDF\SumatraPDF.exe"
    AdobeReader  = "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"
}

$filePath=$args[0]

Add-Type -assembly System.Windows.Forms
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Open With Picker'
$main_form.Width = 600
$main_form.Height = 100
$main_form.AutoSize = $true


$Label = New-Object System.Windows.Forms.Label
$Label.Text = "Open With"
$Label.Location  = New-Object System.Drawing.Point(0,10)
$Label.AutoSize = $true
$main_form.Controls.Add($Label)

$ComboBox = New-Object System.Windows.Forms.ComboBox
$ComboBox.Width = 300
Foreach ($key in $pdfApps.keys)
{
$ComboBox.Items.Add($key);
}
$ComboBox.Location  = New-Object System.Drawing.Point(100,10)
$ComboBox.SelectedIndex = 0
$main_form.Controls.Add($ComboBox)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(400,10)
$Button.Size = New-Object System.Drawing.Size(120,23)
$Button.Text = "Open"
$main_form.Controls.Add($Button)

$Button.Add_Click(
{
Start-Process $pdfApps[$ComboBox.SelectedItem] $filePath
$main_form.Close()
}

)

$main_form.ShowDialog()