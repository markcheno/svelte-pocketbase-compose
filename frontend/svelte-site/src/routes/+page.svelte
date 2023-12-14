<script>
 import PocketBase from 'pocketbase';
 import { page } from '$app/stores';

 let host = $page.url.origin;
 const pb = new PocketBase(host);
 
 let health = pb.health.check();
</script>

<h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>

{#await health}
	<p> connecting to PB... </p>
{:then response}
	<p> Connection to PB: {response.message} </p>
{:catch error}
	<p style="color: read"> Failed to connect to backend </p>
{/await}