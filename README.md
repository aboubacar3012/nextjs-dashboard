## Next.js App Router Course - Starter

This is the starter template for the Next.js App Router Course. It contains the starting code for the dashboard application.

For more information, see the [course curriculum](https://nextjs.org/learn) on the Next.js Website.
# nextjs-dashboard

docker builder prune -af    
docker build -t nextjs-app .
docker run -p 3000:3000 nextjs-app (run en local)

repositoryname: 211125324328.dkr.ecr.eu-west-3.amazonaws.com/elyamaje/nextjsdashboard
docker tag nextjs-app 211125324328.dkr.ecr.eu-west-3.amazonaws.com/elyamaje/nextjsdashboard:latest
docker push 211125324328.dkr.ecr.eu-west-3.amazonaws.com/elyamaje/nextjsdashboard:latest

