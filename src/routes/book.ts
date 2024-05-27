import { PrismaClient } from '@prisma/client'
import Express, { Router, Request, Response } from 'express'

export default function BookRoutes (): Router {
	const router = Express.Router()

	const client = new PrismaClient()

	router.get("/", async (_:Request, res:Response) => {
		try {
			const data = await client.book.findMany({
				include: {
					autor: true,
				}
			})
			res.json(data)
		}
		catch (error) {
			res.status(400).json(error)
		}
	})

	router.get("/:id", async (req:Request, res:Response) => {
		try {
			const id = req.params.id.toString()
			const data = await client.book.findUnique( {
				where: {
					id: id,
				},
				include: {
					autor: true,
				}
			} )
			res.json(data)
		}
		catch (error) {
			res.status(400).json(error)
		}
	})

	return router
}
