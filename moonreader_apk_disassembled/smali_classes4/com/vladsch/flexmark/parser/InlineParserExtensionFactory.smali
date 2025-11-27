.class public interface abstract Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;
.super Ljava/lang/Object;
.source "InlineParserExtensionFactory.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ComputableFactory;
.implements Lcom/vladsch/flexmark/util/dependency/Dependent;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ComputableFactory<",
        "Lcom/vladsch/flexmark/parser/InlineParserExtension;",
        "Lcom/vladsch/flexmark/parser/InlineParser;",
        ">;",
        "Lcom/vladsch/flexmark/util/dependency/Dependent<",
        "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract create(Lcom/vladsch/flexmark/parser/InlineParser;)Lcom/vladsch/flexmark/parser/InlineParserExtension;
.end method

.method public abstract getCharacters()Ljava/lang/CharSequence;
.end method
