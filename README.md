# 🍞 BreadHub Recipe Manager

A professional, responsive recipe management app designed for bakeries and restaurants. Features Firebase cloud storage, real authentication, baker's percentages for bread recipes, cost calculation, user role management, and PDF export functionality.

## 🌟 Features

- **☁️ Firebase Cloud Storage**: Your recipes are safely stored in the cloud
- **🔐 Real Authentication**: Secure email/password login system
- **📱 Responsive Design**: Works perfectly on mobile, tablet, and desktop
- **🍞 Baker's Percentages**: Automatic calculation for bread recipes
- **💰 Cost Management**: Track ingredient costs and total recipe costs
- **👥 User Roles**: 
  - **👑 Admin**: Full access (create, edit, delete, view costs)
  - **👨‍🍳 Baker**: View-only access (recipes without cost information)
- **🖨️ PDF Export**: Professional recipe printouts with branding
- **🔍 Search & Filter**: Find recipes quickly by name or type
- **🔄 Real-time Sync**: Changes sync automatically across all devices
- **🏢 Team Collaboration**: Multiple users can access shared recipes
- **📊 Cost Analytics**: Cost per 100g flour for bread recipes

## 🚀 Live Demo

**URL**: [https://breadhub-recipe.netlify.app](https://breadhub-recipe.netlify.app)

### Demo Accounts
Create your own account or use these test credentials:
- **Admin**: admin@breadhub.com / password123
- **Baker**: baker@breadhub.com / password123

## 🔥 Firebase Setup (Required)

### Step 1: Create Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project"
3. Project name: `breadhub-recipe` (or your choice)
4. Enable Google Analytics (optional)
5. Click "Create project"

### Step 2: Enable Authentication
1. In Firebase Console → Authentication → Get Started
2. Sign-in method tab → Enable:
   - ✅ **Email/Password**
   - ✅ **Google** (optional)
3. Save changes

### Step 3: Create Firestore Database
1. In Firebase Console → Firestore Database → Create database
2. Security rules: Start in **test mode** (we'll secure it later)
3. Location: Choose closest to your users
4. Done

### Step 4: Configure Security Rules
In Firebase Console → Firestore → Rules, replace with:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can read/write their own user document
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // All authenticated users can read/write recipes
    // In production, you might want more granular permissions
    match /recipes/{recipeId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

### Step 5: Get Firebase Configuration
Your Firebase config is already included in the app:
- Project: `breadhub-ce8fd`
- All settings are pre-configured
- Just ensure Firestore and Authentication are enabled

## 🛠️ Local Development

### Prerequisites
- Any modern web browser
- Python 3 (for local server, optional)
- Git

### Quick Start
1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/BreadHub-Recipe.git
   cd BreadHub-Recipe
   ```

2. **Open locally**:
   ```bash
   # Option 1: Open directly in browser
   open index.html
   
   # Option 2: Use local server (recommended)
   python3 -m http.server 8000
   # Then visit: http://localhost:8000
   ```

3. **Make sure Firebase is set up** (see Firebase Setup above)

## 🚀 Deployment

### Automatic Deployment to Netlify
1. **Push to GitHub**:
   ```bash
   git add .
   git commit -m "Initial BreadHub deployment"
   git push origin main
   ```

2. **Connect to Netlify**:
   - Go to [Netlify](https://netlify.com)
   - Click "New site from Git"
   - Choose GitHub and select your repository
   - Deploy settings are auto-configured via `netlify.toml`
   - Click "Deploy site"

3. **Your app will be live in 1-2 minutes!** 🎉

### Manual Deployment
- Drag and drop the project folder to Netlify
- All settings are pre-configured

## 📖 How to Use

### 👤 User Management

#### First Time Setup (Admin)
1. **Create Admin Account**:
   - Visit your deployed app
   - Click "Sign Up"
   - Enter email/password
   - Select "Admin" role
   - Create account

2. **Create Recipes**:
   - Click "➕ New Recipe"
   - Add ingredients with costs
   - For bread: Enter total flour weight for automatic baker's percentages

#### Team Members (Bakers)
1. **Create Baker Account**:
   - Click "Sign Up"
   - Select "Baker" role
   - Can view all recipes (without cost information)

### 🍞 Creating Recipes

#### Bread Recipe Example
1. **Recipe Name**: "Sourdough Boule"
2. **Type**: 🍞 Bread
3. **Total Flour Weight**: 500g
4. **Ingredients**:
   - Bread flour: 500g, $2.50
   - Water: 375g, $0.00
   - Sourdough starter: 100g, $0.50
   - Salt: 10g, $0.05

**Result**: Baker's percentages calculated automatically
- Bread flour: 100%
- Water: 75% (hydration)
- Starter: 20%
- Salt: 2%

#### Drink Recipe Example
1. **Recipe Name**: "Iced Coffee Blend"
2. **Type**: 🥤 Drink
3. **Ingredients**:
   - Coffee beans: 50g, $3.00
   - Water: 500ml, $0.00
   - Sugar syrup: 30ml, $0.50

### 🖨️ PDF Export
- Click "🖨️ Print PDF" on any recipe
- **Admin**: Gets full recipe with costs and percentages
- **Baker**: Gets recipe without cost information
- Professional formatting with BreadHub branding

### 📱 Mobile Usage
- Fully responsive design
- Touch-friendly interface
- Works offline once loaded
- Perfect for kitchen use

## 🏗️ Technical Architecture

### Frontend
- **React 18**: Modern component-based UI
- **Vanilla JavaScript**: No complex build process
- **Responsive CSS**: Mobile-first design
- **jsPDF**: Client-side PDF generation

### Backend (Serverless)
- **Firebase Authentication**: Secure user management
- **Firestore Database**: NoSQL cloud database
- **Firebase Security Rules**: Access control
- **No server costs**: Pay only for usage

### Deployment
- **Netlify**: Static site hosting
- **GitHub**: Version control and CI/CD
- **Custom Domain**: Easy setup

## 🔒 Security Features

- **🔐 Authentication Required**: No anonymous access
- **👥 Role-based Permissions**: Bakers can't see costs
- **🛡️ Firebase Security Rules**: Database-level protection
- **🔒 HTTPS Encryption**: All data transmitted securely
- **🚪 Secure Logout**: Proper session management

## 📊 Data Storage

### What's Stored in Firebase
- **User accounts**: Email, role, creation date
- **Recipes**: Name, type, ingredients, costs, timestamps
- **Real-time sync**: Changes appear instantly on all devices
- **Automatic backups**: Google's enterprise-grade infrastructure

### Privacy & Security
- **End-to-end encryption** in transit
- **Access control** via Firebase rules
- **No third-party tracking**
- **GDPR compliant** (delete accounts anytime)

## 🛠️ Customization

### Adding New Ingredient Units
Edit the units in `index.html` around line 320:
```html
<option value="cups">cups</option>
<option value="oz">oz</option>
<option value="lbs">lbs</option>
```

### Styling Changes
All CSS is in the `<style>` section of `index.html`. Modify:
- Colors: Search for hex codes like `#667eea`
- Fonts: Change `font-family` properties
- Layout: Adjust responsive breakpoints

### Adding Features
The app uses modular React components:
- `AuthForm`: User authentication
- `RecipeForm`: Recipe creation/editing  
- `RecipeList`: Recipe display and search
- `App`: Main application logic

## 🐛 Troubleshooting

### Common Issues

1. **🔥 Firebase Connection Failed**
   - Check internet connection
   - Verify Firebase project is active
   - Ensure Firestore and Authentication are enabled
   - Check browser console for detailed errors

2. **🔐 Login Issues**
   - Verify email/password are correct
   - Check if user account exists
   - Try password reset feature

3. **📱 Mobile Display Issues**
   - Clear browser cache
   - Try different browser
   - Check responsive CSS rules

4. **🖨️ PDF Generation Fails**
   - Ensure jsPDF library loads
   - Check browser console for errors
   - Try different browser

5. **📊 Data Not Syncing**
   - Check internet connection
   - Verify user is logged in
   - Try refreshing the page

### Debug Mode
Open browser developer tools (F12) to see detailed logs:
- ✅ Successful operations
- ❌ Error messages
- 📊 Performance metrics

## 🤝 Contributing

### Development Workflow
1. **Fork the repository**
2. **Create feature branch**: `git checkout -b feature-name`
3. **Make changes** and test locally
4. **Commit changes**: `git commit -m "Add feature"`
5. **Push to GitHub**: `git push origin feature-name`
6. **Create Pull Request**

### Code Style
- Use meaningful variable names
- Add comments for complex logic
- Test on mobile and desktop
- Follow existing patterns

## 📄 License

MIT License - Feel free to use for commercial and personal projects.

## 🆘 Support

- **📧 Email**: support@breadhub.com
- **💬 GitHub Issues**: [Report bugs or request features](https://github.com/yourusername/BreadHub-Recipe/issues)
- **📖 Documentation**: This README.md
- **🎥 Tutorial Videos**: Coming soon

## 🚀 Roadmap

### Version 2.0 Features
- [ ] 📊 Advanced analytics dashboard
- [ ] 🏷️ Recipe categories and tags
- [ ] 📷 Photo upload for recipes
- [ ] 🔄 Recipe versioning
- [ ] 📧 Email recipe sharing
- [ ] 📱 Progressive Web App (PWA)
- [ ] 🌍 Multi-language support
- [ ] 🔗 API integration with POS systems
- [ ] 📈 Inventory management
- [ ] 💳 Pricing calculator

---

**🍞 Made with love for bakers worldwide**  
**⭐ Star this repo if you find it useful!**  
**🔗 Live Demo**: [https://breadhub-recipe.netlify.app](https://breadhub-recipe.netlify.app)