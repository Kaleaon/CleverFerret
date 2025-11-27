.class public interface abstract Lcom/vladsch/flexmark/util/html/MutableAttribute;
.super Ljava/lang/Object;
.source "MutableAttribute.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/html/Attribute;
.implements Lcom/vladsch/flexmark/util/Mutable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/html/Attribute;",
        "Lcom/vladsch/flexmark/util/Mutable<",
        "Lcom/vladsch/flexmark/util/html/MutableAttribute;",
        "Lcom/vladsch/flexmark/util/html/Attribute;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract containsValue(Ljava/lang/CharSequence;)Z
.end method

.method public abstract copy()Lcom/vladsch/flexmark/util/html/MutableAttribute;
.end method

.method public abstract removeValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttribute;
.end method

.method public abstract replaceValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttribute;
.end method

.method public abstract setValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/MutableAttribute;
.end method
