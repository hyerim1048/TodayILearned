## Asyncio

- one python event loop on one OS thread
- one calculation by the processor at a time
- add tasks to this loop and executes them on a FIFO
- need trigger to pass control back to the loop

    loop = asyncio.get_event_loop()
    loop.run_until_complete(tasks()) # async function 

- async - await in python

    async def function_name():
        resp = await some_other_async_function()
        return resp

- async : this function is asynchronous
- await : give control back to the event loop - trigger
    - wait for some other async function to complete  - that doesnt require computation like input operation like a db fetch

[https://medium.com/cowrks/asynchronous-python-app-architecture-5395d5338c4a](https://medium.com/cowrks/asynchronous-python-app-architecture-5395d5338c4a)
