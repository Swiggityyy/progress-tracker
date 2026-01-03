# Firebase Storage Setup Instructions

## Enable Image Uploads

To enable image uploads in the Progress Tracker app, you need to configure Firebase Storage security rules.

### Steps:

1. **Go to Firebase Console**
   - Visit: https://console.firebase.google.com/
   - Login with your Google account

2. **Select Your Project**
   - Click on `progress-tracker-579b7`

3. **Navigate to Storage**
   - Click "Storage" in the left sidebar
   - Click "Get Started" if Storage hasn't been initialized yet

4. **Update Security Rules**
   - Click on the "Rules" tab at the top
   - Replace the existing rules with the contents of `storage.rules` file
   - Click "Publish"

5. **Test the Upload**
   - Go back to your app
   - Try uploading an image
   - Check browser console (F12) for any errors

### What These Rules Do:

The rules in `storage.rules` allow:
- ✅ Anyone to read (view) images
- ✅ Anyone to upload images
- ✅ Anyone to delete images

This is appropriate for a public forum app without authentication.

### Security Note:

Since this is a public app, these open rules are necessary. For a production app with sensitive data, you would want to add authentication and restrict access accordingly.
