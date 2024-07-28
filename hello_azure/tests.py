from django.test import TestCase

# Create your tests here.

class HomePageTests(TestCase):
    def setUp(self):
        self.response = self.client.get('/')

    def test_home_page_status_code(self):
        self.assertEqual(self.response.status_code, 200)

    def test_home_page_contains_welcome(self):
        self.assertContains(self.response, 'Welcome')
