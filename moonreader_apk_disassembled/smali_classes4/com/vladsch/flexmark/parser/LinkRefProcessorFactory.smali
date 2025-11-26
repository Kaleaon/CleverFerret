.class public interface abstract Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;
.super Ljava/lang/Object;
.source "LinkRefProcessorFactory.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ComputableFactory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ComputableFactory<",
        "Lcom/vladsch/flexmark/parser/LinkRefProcessor;",
        "Lcom/vladsch/flexmark/util/ast/Document;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/LinkRefProcessor;
.end method

.method public abstract getBracketNestingLevel(Lcom/vladsch/flexmark/util/options/DataHolder;)I
.end method

.method public abstract getWantExclamationPrefix(Lcom/vladsch/flexmark/util/options/DataHolder;)Z
.end method
