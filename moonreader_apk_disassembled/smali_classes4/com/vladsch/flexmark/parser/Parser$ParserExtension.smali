.class public interface abstract Lcom/vladsch/flexmark/parser/Parser$ParserExtension;
.super Ljava/lang/Object;
.source "Parser.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/builder/Extension;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ParserExtension"
.end annotation


# virtual methods
.method public abstract extend(Lcom/vladsch/flexmark/parser/Parser$Builder;)V
.end method

.method public abstract parserOptions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V
.end method
