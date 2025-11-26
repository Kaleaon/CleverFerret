.class public interface abstract Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.super Ljava/lang/Object;
.source "FormattingAppendable.java"

# interfaces
.implements Ljava/lang/Appendable;


# static fields
.field public static final ALLOW_LEADING_WHITESPACE:I = 0x20

.field public static final COLLAPSE_WHITESPACE:I = 0x2

.field public static final CONVERT_TABS:I = 0x1

.field public static final FORMAT_ALL:I = 0x7

.field public static final PASS_THROUGH:I = 0x10

.field public static final PREFIX_AFTER_PENDING_EOL:I = 0x8

.field public static final SUPPRESS_TRAILING_WHITESPACE:I = 0x4


# virtual methods
.method public abstract addAfterEolRunnable(ILjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract addLine()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract blankLine()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract blankLine(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract blankLineIf(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract closeConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract closePreFormatted()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract column()I
.end method

.method public abstract columnWith(Ljava/lang/CharSequence;II)I
.end method

.method public abstract flush()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract flush(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract flushWhitespaces()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract getAppendable()Ljava/lang/Appendable;
.end method

.method public abstract getIOException()Ljava/io/IOException;
.end method

.method public abstract getIndent()I
.end method

.method public abstract getIndentPrefix()Ljava/lang/CharSequence;
.end method

.method public abstract getLineCount()I
.end method

.method public abstract getModCount()I
.end method

.method public abstract getOptions()I
.end method

.method public abstract getPendingEOL()I
.end method

.method public abstract getPendingSpace()I
.end method

.method public abstract getPrefix()Ljava/lang/CharSequence;
.end method

.method public abstract getPushedPrefixCount()I
.end method

.method public abstract getText()Ljava/lang/String;
.end method

.method public abstract getText(I)Ljava/lang/String;
.end method

.method public abstract getTotalIndentPrefix()Ljava/lang/CharSequence;
.end method

.method public abstract indent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract isPendingEOL()Z
.end method

.method public abstract isPendingSpace()Z
.end method

.method public abstract isPreFormatted()Z
.end method

.method public abstract lastOffset()I
.end method

.method public abstract lastOffset(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/vladsch/flexmark/util/html/FormattingAppendable;"
        }
    .end annotation
.end method

.method public abstract line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract line(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/vladsch/flexmark/util/html/FormattingAppendable;"
        }
    .end annotation
.end method

.method public abstract lineIf(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/vladsch/flexmark/util/html/FormattingAppendable;"
        }
    .end annotation
.end method

.method public abstract lineIf(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract offset()I
.end method

.method public abstract offsetWithPending()I
.end method

.method public abstract openConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract openPreFormatted(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract popPrefix()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract pushPrefix()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract repeat(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract repeat(Ljava/lang/CharSequence;III)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract setIndentOffset(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract setIndentPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract setOptions(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract setPendingEOL(I)V
.end method

.method public abstract setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract unIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method

.method public abstract willIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
.end method
