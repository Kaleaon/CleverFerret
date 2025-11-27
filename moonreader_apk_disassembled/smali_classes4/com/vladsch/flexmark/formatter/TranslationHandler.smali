.class public interface abstract Lcom/vladsch/flexmark/formatter/TranslationHandler;
.super Ljava/lang/Object;
.source "TranslationHandler.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/TranslationContext;


# virtual methods
.method public abstract beginRendering(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
.end method

.method public abstract getTranslatingTexts()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract setRenderPurpose(Lcom/vladsch/flexmark/formatter/RenderPurpose;)V
.end method

.method public abstract setTranslatedTexts(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/CharSequence;",
            ">;)V"
        }
    .end annotation
.end method
