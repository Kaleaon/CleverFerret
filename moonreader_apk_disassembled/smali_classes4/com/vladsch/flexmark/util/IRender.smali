.class public interface abstract Lcom/vladsch/flexmark/util/IRender;
.super Ljava/lang/Object;
.source "IRender.java"


# virtual methods
.method public abstract getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;
.end method

.method public abstract render(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;
.end method

.method public abstract render(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Appendable;)V
.end method

.method public abstract withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/IRender;
.end method
