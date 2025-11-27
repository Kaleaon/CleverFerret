.class public interface abstract Lcom/vladsch/flexmark/formatter/TranslationContext;
.super Ljava/lang/Object;
.source "TranslationContext.java"


# virtual methods
.method public abstract customPlaceholderFormat(Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
.end method

.method public abstract getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;
.end method

.method public abstract getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
.end method

.method public abstract isTransformingText()Z
.end method

.method public abstract nonTranslatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
.end method

.method public abstract transformAnchorRef(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
.end method

.method public abstract transformNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
.end method

.method public abstract transformTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
.end method

.method public abstract translatingRefTargetSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
.end method

.method public abstract translatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
.end method
