<template>
    <div>
        <h1>Blog Anasayfa</h1>

        <!-- Loading / Error kontrolü -->
        <div v-if="pending">Yükleniyor…</div>
        <div v-else-if="error">Hata: {{ error.message }}</div>

        <ul v-else>
            <li v-for="post in posts" :key="post.id">
                <NuxtLink :to="`/posts/${post.id}`">{{ post.title }}</NuxtLink>
            </li>
        </ul>
    </div>
</template>

<script setup>
// useAsyncData ile veriyi çekiyoruz
const { data: posts, pending, error } = await useAsyncData('posts', () =>
    $fetch('https://jsonplaceholder.typicode.com/posts')
)
</script>
