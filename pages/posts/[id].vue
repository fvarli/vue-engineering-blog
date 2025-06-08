<template>
    <div>
        <h2>Yazı #{{ id }}</h2>

        <div v-if="pending">Yazı yükleniyor…</div>
        <div v-else-if="error">Yazı bulunamadı veya hata: {{ error.message }}</div>
        <div v-else>
            <h3>{{ post.title }}</h3>
            <p>{{ post.body }}</p>
        </div>
    </div>
</template>

<script setup>
import { useRoute } from 'vue-router'
const route = useRoute()
const id = route.params.id

// Tek bir yazıyı çekiyoruz
const { data: post, pending, error } = await useAsyncData(`post-${id}`, () =>
    $fetch(`https://jsonplaceholder.typicode.com/posts/${id}`)
)
</script>
