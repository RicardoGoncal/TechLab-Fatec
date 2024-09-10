import { createRouter, createWebHistory } from 'vue-router';
import HomePage from '@/views/HomePage.vue';
import MainPage from '@/views/MainPage.vue';
import OmdbForm from '@/views/OmdbForm.vue';
import PokeForm from '@/views/PokeForm.vue';

const routes = [
  {
    path: '/',
    name: 'HomePage',
    component: HomePage
  },
  {
    path: '/main',
    name: 'MainPage',
    component: MainPage
  },
  {
    path: '/omdbapi',
    name: 'OmdbForm',
    component: OmdbForm
  },
  {
    path: '/pokemonapi',
    name: 'PokeForm',
    component: PokeForm
  }
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
});

export default router;
