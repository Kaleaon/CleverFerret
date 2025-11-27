.class public Lcom/vladsch/flexmark/formatter/MarkdownWriter;
.super Ljava/lang/Object;
.source "MarkdownWriter.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/html/FormattingAppendable;


# instance fields
.field private context:Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

.field private final myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;


# direct methods
.method public constructor <init>(Ljava/lang/Appendable;)V
    .locals 1

    const/4 v0, 0x0

    .line 18
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;-><init>(Ljava/lang/Appendable;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Appendable;I)V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;

    invoke-direct {v0, p1, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;-><init>(Ljava/lang/Appendable;I)V

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-void
.end method


# virtual methods
.method public addAfterEolRunnable(ILjava/lang/Runnable;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 141
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->addAfterEolRunnable(ILjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic addAfterEolRunnable(ILjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->addAfterEolRunnable(ILjava/lang/Runnable;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public addLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->addLine()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic addLine()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->addLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    return-object v0
.end method

.method public addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 145
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 146
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public appendNonTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    const/4 v0, 0x0

    .line 61
    invoke-virtual {p0, v0, p1, v0, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    const/4 v0, 0x0

    .line 65
    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    const/4 v0, 0x0

    .line 69
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->context:Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    invoke-interface {v0}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->context:Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->transformNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-object p0

    .line 76
    :cond_0
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-object p0
.end method

.method public appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/Consumer;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/CharSequence;",
            "Lcom/vladsch/flexmark/util/Consumer<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/vladsch/flexmark/formatter/MarkdownWriter;"
        }
    .end annotation

    .line 82
    iget-object p5, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->context:Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    invoke-interface {p5}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result p5

    if-eqz p5, :cond_0

    .line 83
    iget-object p5, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->context:Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    invoke-interface {p5, p1, p2, p3, p4}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->transformNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-object p0

    .line 85
    :cond_0
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-object p0
.end method

.method public appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    const/4 v0, 0x0

    .line 91
    invoke-virtual {p0, v0, p1, v0, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public appendTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    const/4 v0, 0x0

    .line 95
    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public appendTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    const/4 v0, 0x0

    .line 99
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public appendTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->context:Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    invoke-interface {v0}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->context:Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->transformTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-object p0

    :cond_0
    if-eqz p1, :cond_1

    .line 106
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 107
    :cond_1
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    if-eqz p3, :cond_2

    .line 108
    invoke-virtual {p0, p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :cond_2
    return-object p0
.end method

.method public blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->blankLine()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public blankLine(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->blankLine(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic blankLine()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic blankLine(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public blankLineIf(Z)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->blankLineIf(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic blankLineIf(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLineIf(Z)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public closeConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->closeConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic closeConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->closeConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public closePreFormatted()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->closePreFormatted()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic closePreFormatted()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->closePreFormatted()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    return-object v0
.end method

.method public column()I
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->column()I

    move-result v0

    return v0
.end method

.method public columnWith(Ljava/lang/CharSequence;II)I
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->columnWith(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public flush()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->flush()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public flush(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 154
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->flush(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic flush()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->flush()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic flush(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->flush(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public flushWhitespaces()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->flushWhitespaces()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic flushWhitespaces()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->flushWhitespaces()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    return-object v0
.end method

.method public getAppendable()Ljava/lang/Appendable;
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getAppendable()Ljava/lang/Appendable;

    move-result-object v0

    return-object v0
.end method

.method public getContext()Lcom/vladsch/flexmark/formatter/NodeFormatterContext;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->context:Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    return-object v0
.end method

.method public getIOException()Ljava/io/IOException;
    .locals 1

    .line 138
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getIOException()Ljava/io/IOException;

    move-result-object v0

    return-object v0
.end method

.method public getIndent()I
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getIndent()I

    move-result v0

    return v0
.end method

.method public getIndentPrefix()Ljava/lang/CharSequence;
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getIndentPrefix()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getLineCount()I
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getLineCount()I

    move-result v0

    return v0
.end method

.method public getModCount()I
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getModCount()I

    move-result v0

    return v0
.end method

.method public getOptions()I
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getOptions()I

    move-result v0

    return v0
.end method

.method public getPendingEOL()I
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getPendingEOL()I

    move-result v0

    return v0
.end method

.method public getPendingSpace()I
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getPendingSpace()I

    move-result v0

    return v0
.end method

.method public getPrefix()Ljava/lang/CharSequence;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getPrefix()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getPushedPrefixCount()I
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getPushedPrefixCount()I

    move-result v0

    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getText(I)Ljava/lang/String;
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getText(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTotalIndentPrefix()Ljava/lang/CharSequence;
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getTotalIndentPrefix()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public indent()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->indent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic indent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->indent()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    return-object v0
.end method

.method public isLastBlockQuoteChild(Lcom/vladsch/flexmark/util/ast/Node;)Z
    .locals 2

    .line 43
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 44
    instance-of v1, v0, Lcom/vladsch/flexmark/ast/BlockQuote;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isPendingEOL()Z
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->isPendingEOL()Z

    move-result v0

    return v0
.end method

.method public isPendingSpace()Z
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->isPendingSpace()Z

    move-result v0

    return v0
.end method

.method public isPreFormatted()Z
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->isPreFormatted()Z

    move-result v0

    return v0
.end method

.method public lastOffset()I
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->lastOffset()I

    move-result v0

    return v0
.end method

.method public lastOffset(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/vladsch/flexmark/formatter/MarkdownWriter;"
        }
    .end annotation

    .line 155
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->lastOffset(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic lastOffset(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->lastOffset(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public line(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/vladsch/flexmark/formatter/MarkdownWriter;"
        }
    .end annotation

    .line 158
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic line(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public lineIf(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/vladsch/flexmark/formatter/MarkdownWriter;"
        }
    .end annotation

    .line 160
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->lineIf(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public lineIf(Z)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 159
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->lineIf(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic lineIf(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->lineIf(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic lineIf(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->lineIf(Z)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public offset()I
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offset()I

    move-result v0

    return v0
.end method

.method public offsetWithPending()I
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v0

    return v0
.end method

.method public openConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->openConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic openConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->openConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public openPreFormatted(Z)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->openPreFormatted(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic openPreFormatted(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->openPreFormatted(Z)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public popPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 163
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->popPrefix()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic popPrefix()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->popPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    return-object v0
.end method

.method public pushPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->pushPrefix()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic pushPrefix()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->pushPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    return-object v0
.end method

.method public repeat(CI)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public repeat(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public repeat(Ljava/lang/CharSequence;III)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(Ljava/lang/CharSequence;III)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->repeat(CI)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic repeat(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->repeat(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic repeat(Ljava/lang/CharSequence;III)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->repeat(Ljava/lang/CharSequence;III)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public setContext(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->context:Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    return-void
.end method

.method public setIndentOffset(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setIndentOffset(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic setIndentOffset(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->setIndentOffset(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public setIndentPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setIndentPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic setIndentPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->setIndentPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public setOptions(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setOptions(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic setOptions(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->setOptions(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public setPendingEOL(I)V
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setPendingEOL(I)V

    return-void
.end method

.method public setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 171
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    return-object p1
.end method

.method public tailBlankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    const/4 v0, 0x1

    .line 39
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->tailBlankLine(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    return-object v0
.end method

.method public tailBlankLine(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->context:Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    invoke-interface {v0}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getCurrentNode()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->isLastBlockQuoteChild(Lcom/vladsch/flexmark/util/ast/Node;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 50
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->getPushedPrefixCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, -0x1

    .line 51
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->flush(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 52
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->popPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 53
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->pushPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 56
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getAppendable()Ljava/lang/Appendable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unIndent()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->unIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic unIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->unIndent()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    return-object v0
.end method

.method public willIndent()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->myAppendable:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->willIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic willIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->willIndent()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    return-object v0
.end method
