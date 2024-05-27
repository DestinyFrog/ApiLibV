import Express, { Request, Response } from 'express'
import dotenv from 'dotenv'
import cors from 'cors'
import UserRoutes from './routes/usuario'

dotenv.config()

const app = Express()

app.use( Express.json() )
app.use( cors() )

app.use("/user", UserRoutes() )

app.get("/", (_req:Request, res:Response) => {
	res.json({ "message": "Hello, World !!" })
})

const port = process.env.PORT || 3000

app.listen(port, () =>
	console.log(`Listening on ${port}`) )