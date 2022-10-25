import greetingJs from '../../src/greetingJs'

describe('print hello 2', () => {
  test('print hello with 1234', () => {
    const greetingMessage = greetingJs.run('1234')
    expect(greetingMessage).toBe('(javascript) hello 1234')
  })
})
