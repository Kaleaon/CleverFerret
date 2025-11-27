.class public interface abstract Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;
.super Ljava/lang/Object;
.source "CustomBlockParserFactory.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ComputableFactory;
.implements Lcom/vladsch/flexmark/util/dependency/Dependent;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ComputableFactory<",
        "Lcom/vladsch/flexmark/parser/block/BlockParserFactory;",
        "Lcom/vladsch/flexmark/util/options/DataHolder;",
        ">;",
        "Lcom/vladsch/flexmark/util/dependency/Dependent<",
        "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/block/BlockParserFactory;
.end method
