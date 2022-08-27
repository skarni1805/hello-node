const app = require('../app');
const request = require('supertest');
const baseURL = "http://localhost:8080";

describe('GET /', () => {
  afterAll(() => {
    app.close();
  });

  it('should return success', async () => {
    const response = await request(baseURL).get('/');
    expect(response.statusCode).toBe(200);
    expect(response.body.error).toBe(undefined);
    expect(response.text).toBe('Hello World!');
  });
});
