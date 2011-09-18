-- A short automator script to send selected text to Evernote.
-- To create it:
--  1. In Automator, create a new service. Set "Service Receives" to text
--      and drag in the "Run Applescript" action
--  2. Paste this code into the Action.
--  3. Save the action
--  4. In System Preferences -> Keyboard, select the "Services" option
--  5. Assign a keyboard shortcut to this service
--  6. Test it in any running application.
--  7. Modify, and contribute back.
--
--

on run {input}
    set note_title to text returned of (display dialog ¬
        "Title of New Note: " default answer ¬
        "Untitled" buttons {"Continue", "Cancel"} ¬
        default button 1)
    set dest_notebook to text returned of (display dialog ¬
        "Notebook: " default answer "" buttons {"Continue", "Cancel"} default button 1)
    tell application "Evernote"
        try
            if dest_notebook is not "" then
                create note title note_title with text input notebook dest_notebook
            else
                create note title note_title with text input
            end if
        on error error_message number error_number
            display alert "Send to Evernote failed" message "Error:     " & error_message & " " & "Error Number:  " & error_number as warning
        end try
    end tell
end run