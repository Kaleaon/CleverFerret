.class public interface abstract Lcom/vladsch/flexmark/parser/block/CharacterNodeFactory;
.super Ljava/lang/Object;
.source "CharacterNodeFactory.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/Factory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/Factory<",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract skipNext(C)Z
.end method

.method public abstract skipPrev(C)Z
.end method

.method public abstract wantSkippedWhitespace()Z
.end method
