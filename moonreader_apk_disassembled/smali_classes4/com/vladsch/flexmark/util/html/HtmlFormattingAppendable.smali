.class public interface abstract Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.super Ljava/lang/Object;
.source "HtmlFormattingAppendable.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/html/FormattingAppendable;


# virtual methods
.method public abstract attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public varargs abstract attr([Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract closePre()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract getAttributes()Lcom/vladsch/flexmark/util/html/Attributes;
.end method

.method public abstract getOpenTags()Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Stack<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getOpenTagsAfterLast(Ljava/lang/CharSequence;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract inPre()Z
.end method

.method public abstract openPre()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract raw(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract rawIndentedPre(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract rawPre(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract setAttributes(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract tag(Ljava/lang/CharSequence;ZZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract tagIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract tagLine(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract tagLine(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract tagLine(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract tagLineIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract tagVoid(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract tagVoidLine(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract withAttr()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract withCondIndent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method

.method public abstract withCondLine()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
.end method
