<#include "module/macro.ftl">
<@layout title="${settings.links_title!'友情链接'} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 h-1/2">
      <#if settings.links_placeholder?? && settings.links_placeholder!=''>
        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
          <img src="${settings.links_placeholder!}"
               class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60"
               alt="${settings.links_title!'友情链接'}">
        </div>
      <#else>
        <div class="placeholder-bg">
        </div>
      </#if>
      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">
        <h2 class="text-white mb-5 mt-4 leading-loose relative w-full text-4xl text-center dark:text-gray-300">
          ${settings.links_title!'友情链接'}
        </h2>
        <hr class="text-center bg-red-300 h-0.5 border-none w-20 mx-auto -mt-5 mb-3"/>
      </div>
    </header>
    <div
            class="mx-auto px-10 my-16 max-w-5xl tracking-wider md:leading-relaxed sm:leading-normal max-w-5xl fade-up">
      <@linkTag method="listTeams">
        <#list teams as item>
          <#if item.team?? && item.team!=''>
            <h3 class="w-full m-4">${item.team}</h3>
          </#if>
          <div class="flex flex-row flex-wrap justify-items-center grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-1">
            <#list item.links?sort_by('priority')?reverse  as link>
              <a class="m-card flex p-1.5 text-gray-600 bg-white rounded shadow-md justify-start content-start flex-col w-full max-w-16" style="background:#fff; color:#8e7f7f" target="_blank"
                 href="${link.url}">
                <div class="flex self-center">
                  <img class="lazyload object-cover m-avatar w-20 h-20 rounded-full bg-white max-w-full border-2 border-white border-solid" data-src="${link.logo}" src="${theme_base!}/source/images/loading.svg" onerror="onerror=null;src='${theme_base!}/source/images/loading.svg'">
                </div>
                <div class=" my-1.5 mx-3.5 flex flex-col text-center">
                  <p class="pt-3 pb-1.5 font-semibold">${link.name}</p>
                  <div class=" py-1.5 break-all flex items-center">
                    <p class=" inline-block w-full overflow-hidden overflow-ellipsis whitespace-nowrap break-words m-0 text-center" title="${link.description}">${link.description}</p>
                  </div>
                </div>
              </a>
            </#list>
          </div>
        </#list>
      </@linkTag>
    </div>
  </main>
</@layout>
