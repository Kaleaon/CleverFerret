.class public interface abstract Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;
.super Ljava/lang/Object;
.source "LinkResolverContext.java"


# virtual methods
.method public abstract encodeUrl(Ljava/lang/CharSequence;)Ljava/lang/String;
.end method

.method public abstract getCurrentNode()Lcom/vladsch/flexmark/util/ast/Node;
.end method

.method public abstract getDocument()Lcom/vladsch/flexmark/util/ast/Document;
.end method

.method public abstract getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;
.end method

.method public abstract render(Lcom/vladsch/flexmark/util/ast/Node;)V
.end method

.method public abstract renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
.end method

.method public abstract resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
.end method

.method public abstract resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
.end method
