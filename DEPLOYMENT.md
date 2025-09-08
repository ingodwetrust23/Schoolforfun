# Deployment Guide - Schoolforfun

This guide covers various deployment options for the Schoolforfun application.

## 🚀 Quick Deployment Options

### Option 1: GitHub Pages (Recommended for Demo)

1. **Fork/Clone Repository**
   ```bash
   git clone https://github.com/yourusername/schoolforfun.git
   cd schoolforfun
   ```

2. **Update Homepage URL**
   Edit `package.json`:
   ```json
   "homepage": "https://yourusername.github.io/schoolforfun"
   ```

3. **Install gh-pages**
   ```bash
   npm install --save-dev gh-pages
   ```

4. **Deploy**
   ```bash
   npm run deploy
   ```

5. **Enable GitHub Pages**
   - Go to repository Settings → Pages
   - Select "gh-pages" branch
   - Your app will be available at: `https://yourusername.github.io/schoolforfun`

### Option 2: Netlify (Recommended for Production)

1. **Connect Repository**
   - Go to [Netlify](https://netlify.com)
   - Click "New site from Git"
   - Connect your GitHub repository

2. **Configure Build Settings**
   - Build command: `npm run build`
   - Publish directory: `build`
   - Node version: `18`

3. **Deploy**
   - Netlify will automatically deploy on every push
   - Get a custom domain or use the provided netlify.app URL

### Option 3: Vercel

1. **Install Vercel CLI**
   ```bash
   npm i -g vercel
   ```

2. **Deploy**
   ```bash
   vercel
   ```

3. **Follow Prompts**
   - Link to existing project or create new
   - Configure settings
   - Deploy

## 🐳 Docker Deployment

### Local Docker

1. **Build Image**
   ```bash
   docker build -t schoolforfun .
   ```

2. **Run Container**
   ```bash
   docker run -p 3000:80 schoolforfun
   ```

3. **Access Application**
   Open `http://localhost:3000`

### Docker Compose

1. **Development**
   ```bash
   docker-compose up
   ```

2. **Production**
   ```bash
   docker-compose --profile production up -d
   ```

### Cloud Docker Deployment

#### AWS ECS
1. Push image to ECR
2. Create ECS task definition
3. Create ECS service
4. Configure load balancer

#### Google Cloud Run
1. Build and push to GCR
2. Deploy to Cloud Run
3. Configure domain mapping

#### Azure Container Instances
1. Push to Azure Container Registry
2. Create container instance
3. Configure public IP

## ☁️ Cloud Platform Deployment

### AWS S3 + CloudFront

1. **Build Application**
   ```bash
   npm run build
   ```

2. **Upload to S3**
   ```bash
   aws s3 sync build/ s3://your-bucket-name
   ```

3. **Configure CloudFront**
   - Create distribution
   - Set S3 as origin
   - Configure custom error pages (404 → index.html)

4. **Set Up Custom Domain** (Optional)
   - Add SSL certificate
   - Configure Route 53

### Google Cloud Platform

1. **Build Application**
   ```bash
   npm run build
   ```

2. **Deploy to App Engine**
   ```bash
   gcloud app deploy
   ```

3. **Or Deploy to Cloud Storage**
   ```bash
   gsutil -m rsync -r build/ gs://your-bucket-name
   ```

### Microsoft Azure

1. **Build Application**
   ```bash
   npm run build
   ```

2. **Deploy to Static Web Apps**
   ```bash
   az staticwebapp create --name schoolforfun --resource-group myResourceGroup --source https://github.com/yourusername/schoolforfun
   ```

## 🏢 Traditional Web Hosting

### Shared Hosting (cPanel, etc.)

1. **Build Application**
   ```bash
   npm run build
   ```

2. **Upload Files**
   - Upload all files from `build/` folder to `public_html/`
   - Ensure `index.html` is in the root directory

3. **Configure Server**
   - Add `.htaccess` file for client-side routing:
   ```apache
   RewriteEngine On
   RewriteCond %{REQUEST_FILENAME} !-f
   RewriteCond %{REQUEST_FILENAME} !-d
   RewriteRule . /index.html [L]
   ```

### VPS/Dedicated Server

1. **Install Nginx**
   ```bash
   sudo apt update
   sudo apt install nginx
   ```

2. **Build Application**
   ```bash
   npm run build
   ```

3. **Configure Nginx**
   ```nginx
   server {
       listen 80;
       server_name yourdomain.com;
       root /var/www/schoolforfun/build;
       index index.html;

       location / {
           try_files $uri $uri/ /index.html;
       }
   }
   ```

4. **Deploy Files**
   ```bash
   sudo cp -r build/* /var/www/schoolforfun/build/
   ```

## 🔧 Environment Configuration

### Production Environment Variables

Create `.env.production`:
```env
REACT_APP_API_URL=https://api.schoolforfun.com
REACT_APP_SCHOOL_NAME=Your School Name
REACT_APP_VERSION=1.0.0
REACT_APP_ENVIRONMENT=production
```

### Build with Environment Variables
```bash
REACT_APP_API_URL=https://api.schoolforfun.com npm run build
```

## 🔒 Security Considerations

### HTTPS Configuration
- Always use HTTPS in production
- Configure SSL certificates
- Use HSTS headers

### Security Headers
Add to your server configuration:
```nginx
add_header X-Frame-Options "SAMEORIGIN" always;
add_header X-Content-Type-Options "nosniff" always;
add_header X-XSS-Protection "1; mode=block" always;
add_header Referrer-Policy "strict-origin-when-cross-origin" always;
```

### Content Security Policy
```nginx
add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:; font-src 'self' https:; connect-src 'self';" always;
```

## 📊 Performance Optimization

### Build Optimization
```bash
# Analyze bundle size
npm run analyze

# Build with optimizations
npm run build
```

### Server Configuration
- Enable gzip compression
- Set proper cache headers
- Use CDN for static assets
- Implement lazy loading

### Monitoring
- Set up error tracking (Sentry, LogRocket)
- Monitor performance (Google Analytics, Hotjar)
- Track user behavior and engagement

## 🚨 Troubleshooting

### Common Issues

1. **404 Errors on Refresh**
   - Ensure server is configured for client-side routing
   - Check `.htaccess` or nginx configuration

2. **Build Failures**
   - Check Node.js version compatibility
   - Clear npm cache: `npm cache clean --force`
   - Delete `node_modules` and reinstall

3. **Environment Variables Not Working**
   - Ensure variables start with `REACT_APP_`
   - Rebuild after changing environment variables

4. **Docker Build Issues**
   - Check Dockerfile syntax
   - Ensure all required files are copied
   - Verify nginx configuration

### Debug Commands
```bash
# Check build output
npm run build

# Test production build locally
npx serve -s build

# Check Docker logs
docker logs container-name

# Test nginx configuration
nginx -t
```

## 📈 Scaling Considerations

### Horizontal Scaling
- Use load balancers
- Implement CDN
- Database optimization
- Caching strategies

### Vertical Scaling
- Increase server resources
- Optimize application code
- Use efficient algorithms
- Minimize bundle size

## 🔄 CI/CD Pipeline

### GitHub Actions
The repository includes a complete CI/CD pipeline:
- Automated testing
- Build verification
- Deployment to GitHub Pages
- Security scanning

### Custom CI/CD
- Set up automated builds
- Run tests before deployment
- Deploy to staging environment
- Promote to production

## 📞 Support

For deployment issues:
- Check this guide first
- Review error logs
- Test locally before deploying
- Contact support if needed

---

**Happy Deploying! 🚀**
