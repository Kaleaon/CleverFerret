.class public Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
.super Ljava/lang/Object;
.source "HtmlFormattingAppendableBase.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;"
    }
.end annotation


# instance fields
.field private currentAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

.field private indentIndentingChildren:Z

.field private lineOnChildText:Z

.field private final myOpenTags:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

.field private suppressCloseTagLine:Z

.field private suppressOpenTagLine:Z

.field private withAttributes:Z


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/html/FormattingAppendable;Ljava/lang/Appendable;Z)V
    .locals 0

    if-eqz p3, :cond_0

    .line 26
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getIndentPrefix()Ljava/lang/CharSequence;

    move-result-object p3

    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    move-result p3

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getOptions()I

    move-result p1

    invoke-direct {p0, p2, p3, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;-><init>(Ljava/lang/Appendable;II)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Appendable;II)V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->indentIndentingChildren:Z

    .line 19
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineOnChildText:Z

    .line 20
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withAttributes:Z

    .line 21
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressOpenTagLine:Z

    .line 22
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressCloseTagLine:Z

    .line 23
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->myOpenTags:Ljava/util/Stack;

    .line 30
    new-instance v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;

    invoke-direct {v0, p1, p3}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;-><init>(Ljava/lang/Appendable;I)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 31
    const-string p1, " "

    invoke-static {p1, p2}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setIndentPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 14
    iget-object p0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method private haveOptions(I)Z
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getOptions()I

    move-result v0

    and-int/2addr p1, v0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method public bridge synthetic addAfterEolRunnable(ILjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->addAfterEolRunnable(ILjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public addAfterEolRunnable(ILjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Runnable;",
            ")TT;"
        }
    .end annotation

    .line 539
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->addAfterEolRunnable(ILjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic addLine()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->addLine()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public addLine()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 410
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->addLine()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    .line 521
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(C)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public append(C)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C)TT;"
        }
    .end annotation

    .line 472
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    .line 460
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "II)TT;"
        }
    .end annotation

    .line 466
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(C)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

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
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

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
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr([Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->attr([Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/html/Attributes;",
            ")TT;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 131
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/html/Attributes;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 132
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->currentAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    if-nez v0, :cond_0

    .line 133
    new-instance v0, Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/html/Attributes;-><init>(Lcom/vladsch/flexmark/util/html/Attributes;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->currentAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    return-object p0

    .line 135
    :cond_0
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/html/Attributes;->addValues(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;

    :cond_1
    return-object p0
.end method

.method public attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    .line 111
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->currentAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    if-nez v0, :cond_0

    .line 112
    new-instance v0, Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/Attributes;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->currentAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    .line 114
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->currentAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/html/Attributes;->addValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    return-object p0
.end method

.method public varargs attr([Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/vladsch/flexmark/util/html/Attribute;",
            ")TT;"
        }
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->currentAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    if-nez v0, :cond_0

    .line 121
    new-instance v0, Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/Attributes;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->currentAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    .line 123
    :cond_0
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 124
    iget-object v3, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->currentAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/html/Attribute;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/html/Attribute;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lcom/vladsch/flexmark/util/html/Attributes;->addValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public bridge synthetic blankLine()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->blankLine()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic blankLine(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->blankLine(I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public blankLine()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 420
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->blankLine()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public blankLine(I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 425
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->blankLine(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic blankLineIf(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->blankLineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public blankLineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .line 430
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->blankLineIf(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic closeConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->closeConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public closeConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/html/ConditionalFormatter;",
            ")TT;"
        }
    .end annotation

    .line 653
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->closeConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic closePre()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->closePre()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public closePre()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->closePreFormatted()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic closePreFormatted()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->closePreFormatted()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public closePreFormatted()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 643
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->closePreFormatted()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    .line 267
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 269
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    const-string v2, ">"

    if-ne v0, v1, :cond_0

    .line 270
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const-string v1, "<"

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object v0

    invoke-interface {v0, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const/4 v0, 0x1

    .line 271
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-interface {p1, v0, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tagClosed(Ljava/lang/CharSequence;)V

    return-object p0

    .line 273
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const-string v1, "</"

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object v0

    invoke-interface {v0, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 274
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tagClosed(Ljava/lang/CharSequence;)V

    return-object p0

    .line 267
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "closeTag called with tag:\'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\'"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public column()I
    .locals 1

    .line 630
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->column()I

    move-result v0

    return v0
.end method

.method public columnWith(Ljava/lang/CharSequence;II)I
    .locals 1

    .line 633
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->columnWith(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public bridge synthetic flush()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->flush()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic flush(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->flush(I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public flush()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 487
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->flush()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public flush(I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 497
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->flush(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic flushWhitespaces()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->flushWhitespaces()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public flushWhitespaces()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 492
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->flush()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public getAppendable()Ljava/lang/Appendable;
    .locals 1

    .line 385
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getAppendable()Ljava/lang/Appendable;

    move-result-object v0

    return-object v0
.end method

.method public getAttributes()Lcom/vladsch/flexmark/util/html/Attributes;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->currentAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    return-object v0
.end method

.method public getIOException()Ljava/io/IOException;
    .locals 1

    .line 455
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getIOException()Ljava/io/IOException;

    move-result-object v0

    return-object v0
.end method

.method public getIndent()I
    .locals 1

    .line 602
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getIndent()I

    move-result v0

    return v0
.end method

.method public getIndentPrefix()Ljava/lang/CharSequence;
    .locals 1

    .line 502
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getIndentPrefix()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getLineCount()I
    .locals 1

    .line 611
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getLineCount()I

    move-result v0

    return v0
.end method

.method public getModCount()I
    .locals 1

    .line 397
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getModCount()I

    move-result v0

    return v0
.end method

.method protected getOpenTagText()Ljava/lang/String;
    .locals 3

    .line 181
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->myOpenTags:Ljava/util/Stack;

    const-string v1, ", "

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/vladsch/flexmark/util/Utils;->splice(Ljava/util/Collection;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOpenTags()Ljava/util/Stack;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Stack<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 206
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->myOpenTags:Ljava/util/Stack;

    return-object v0
.end method

.method public getOpenTagsAfterLast(Ljava/lang/CharSequence;)Ljava/util/List;
    .locals 5
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

    .line 211
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->myOpenTags:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p1

    .line 213
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->myOpenTags:Ljava/util/Stack;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 214
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 216
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    move v2, v1

    :goto_0
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_2

    .line 218
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    goto :goto_0

    :cond_2
    move v2, v1

    .line 223
    :goto_1
    invoke-interface {v0, v2, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getOptions()I
    .locals 1

    .line 388
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getOptions()I

    move-result v0

    return v0
.end method

.method public getPendingEOL()I
    .locals 1

    .line 593
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getPendingEOL()I

    move-result v0

    return v0
.end method

.method public getPendingSpace()I
    .locals 1

    .line 583
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getPendingSpace()I

    move-result v0

    return v0
.end method

.method public getPrefix()Ljava/lang/CharSequence;
    .locals 1

    .line 511
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getPrefix()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getPushedPrefixCount()I
    .locals 1

    .line 416
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getPushedPrefixCount()I

    move-result v0

    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 478
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getText(I)Ljava/lang/String;
    .locals 1

    .line 483
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getText(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTotalIndentPrefix()Ljava/lang/CharSequence;
    .locals 1

    .line 545
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getTotalIndentPrefix()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public inPre()Z
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->isPreFormatted()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic indent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->indent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public indent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 440
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->indent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public isPendingEOL()Z
    .locals 1

    .line 588
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->isPendingSpace()Z

    move-result v0

    return v0
.end method

.method public isPendingSpace()Z
    .locals 1

    .line 578
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->isPendingSpace()Z

    move-result v0

    return v0
.end method

.method public isPreFormatted()Z
    .locals 1

    .line 401
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->isPreFormatted()Z

    move-result v0

    return v0
.end method

.method public isSuppressCloseTagLine()Z
    .locals 1

    .line 43
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressCloseTagLine:Z

    return v0
.end method

.method public isSuppressOpenTagLine()Z
    .locals 1

    .line 35
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressOpenTagLine:Z

    return v0
.end method

.method public lastOffset()I
    .locals 1

    .line 621
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->lastOffset()I

    move-result v0

    return v0
.end method

.method public bridge synthetic lastOffset(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lastOffset(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public lastOffset(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Integer;",
            ">;)TT;"
        }
    .end annotation

    .line 616
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->lastOffset(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic line(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->line(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 405
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public line(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Boolean;",
            ">;)TT;"
        }
    .end annotation

    .line 549
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic lineIf(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineIf(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic lineIf(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public lineIf(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Boolean;",
            ">;)TT;"
        }
    .end annotation

    .line 554
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->lineIf(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .line 435
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->lineIf(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public offset()I
    .locals 1

    .line 624
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offset()I

    move-result v0

    return v0
.end method

.method public offsetWithPending()I
    .locals 1

    .line 627
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->offsetWithPending()I

    move-result v0

    return v0
.end method

.method public bridge synthetic openConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->openConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public openConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/html/ConditionalFormatter;",
            ")TT;"
        }
    .end annotation

    .line 648
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->openConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic openPre()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->openPre()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public openPre()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->openPreFormatted(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic openPreFormatted(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->openPreFormatted(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public openPreFormatted(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .line 637
    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->openPreFormatted(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic popPrefix()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->popPrefix()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public popPrefix()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 533
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->popPrefix()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method protected popTag(Ljava/lang/CharSequence;)V
    .locals 4

    .line 189
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->myOpenTags:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    const-string v1, "Close tag \'"

    if-nez v0, :cond_1

    .line 190
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->myOpenTags:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 191
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 193
    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->myOpenTags:Ljava/util/Stack;

    invoke-virtual {p1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    return-void

    .line 192
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\' does not match \'"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\' in "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->getOpenTagText()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 189
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\' with no tags open"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic pushPrefix()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->pushPrefix()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public pushPrefix()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 527
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->pushPrefix()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method protected pushTag(Ljava/lang/CharSequence;)V
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->myOpenTags:Ljava/util/Stack;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public bridge synthetic raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic raw(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->raw(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public raw(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "I)TT;"
        }
    .end annotation

    :goto_0
    add-int/lit8 v0, p2, -0x1

    if-lez p2, :cond_0

    .line 80
    iget-object p2, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move p2, v0

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public bridge synthetic rawIndentedPre(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->rawIndentedPre(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public rawIndentedPre(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    .line 94
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getPrefix()Ljava/lang/CharSequence;

    move-result-object v0

    .line 95
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getTotalIndentPrefix()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 96
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->openPreFormatted(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object v1

    .line 97
    invoke-interface {v1, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object p1

    .line 98
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->closePreFormatted()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 99
    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic rawPre(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->rawPre(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public rawPre(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    .line 86
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->openPreFormatted(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object v0

    .line 87
    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object p1

    .line 88
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->closePreFormatted()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->repeat(CI)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic repeat(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->repeat(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic repeat(Ljava/lang/CharSequence;III)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->repeat(Ljava/lang/CharSequence;III)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public repeat(CI)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(CI)TT;"
        }
    .end annotation

    .line 560
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public repeat(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "I)TT;"
        }
    .end annotation

    .line 566
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public repeat(Ljava/lang/CharSequence;III)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "III)TT;"
        }
    .end annotation

    .line 572
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->repeat(Ljava/lang/CharSequence;III)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic setAttributes(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->setAttributes(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public setAttributes(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/html/Attributes;",
            ")TT;"
        }
    .end annotation

    .line 154
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->currentAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    return-object p0
.end method

.method public bridge synthetic setIndentOffset(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->setIndentOffset(I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public setIndentOffset(I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 606
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setIndentOffset(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic setIndentPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->setIndentPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public setIndentPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    .line 506
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setIndentPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic setOptions(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->setOptions(I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public setOptions(I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 392
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setOptions(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public setPendingEOL(I)V
    .locals 1

    .line 598
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setPendingEOL(I)V

    return-void
.end method

.method public bridge synthetic setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    .line 515
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public setSuppressCloseTagLine(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .line 47
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressCloseTagLine:Z

    return-object p0
.end method

.method public setSuppressOpenTagLine(Z)V
    .locals 0

    .line 39
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressOpenTagLine:Z

    return-void
.end method

.method public bridge synthetic tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic tag(Ljava/lang/CharSequence;ZZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tag(Ljava/lang/CharSequence;ZZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 172
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Z)TT;"
        }
    .end annotation

    .line 228
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_0

    goto/16 :goto_1

    .line 232
    :cond_0
    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withAttributes:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 233
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->currentAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    .line 234
    iput-object v2, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->currentAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    .line 235
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withAttributes:Z

    move-object v2, v1

    .line 238
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const-string v1, "<"

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 239
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    if-eqz v2, :cond_3

    .line 241
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/html/Attributes;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 242
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/html/Attributes;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/html/Attribute;

    .line 243
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/Attribute;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 245
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/Attribute;->isNonRendering()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    .line 247
    :cond_2
    iget-object v3, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const-string v4, " "

    invoke-interface {v3, v4}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 248
    iget-object v3, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/Attribute;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x1

    invoke-static {v1, v4}, Lcom/vladsch/flexmark/util/html/Escaping;->escapeHtml(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 249
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const-string v3, "=\""

    invoke-interface {v1, v3}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 250
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-static {v2, v4}, Lcom/vladsch/flexmark/util/html/Escaping;->escapeHtml(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 251
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const-string v2, "\""

    invoke-interface {v1, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    goto :goto_0

    :cond_3
    if-eqz p2, :cond_4

    .line 256
    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const-string p2, " />"

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0

    .line 258
    :cond_4
    iget-object p2, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const-string v0, ">"

    invoke-interface {p2, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 259
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tagOpened(Ljava/lang/CharSequence;)V

    return-object p0

    .line 228
    :cond_5
    :goto_1
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public tag(Ljava/lang/CharSequence;ZZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "ZZ",
            "Ljava/lang/Runnable;",
            ")TT;"
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 281
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressOpenTagLine:Z

    if-nez v0, :cond_0

    .line 282
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->willIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 283
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_0
    const/4 v0, 0x0

    .line 286
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    if-eqz p2, :cond_1

    .line 288
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->indent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 290
    :cond_1
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getOptions()I

    move-result v1

    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_2

    .line 291
    invoke-interface {p4}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 293
    :cond_2
    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineOnChildText:Z

    .line 294
    iget-boolean v2, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->indentIndentingChildren:Z

    .line 295
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineOnChildText:Z

    .line 296
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->indentIndentingChildren:Z

    if-nez v1, :cond_3

    if-eqz v2, :cond_4

    .line 299
    :cond_3
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    new-instance v3, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$1;

    invoke-direct {v3, p0, v2, v1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$1;-><init>(Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;ZZ)V

    invoke-interface {v0, v3}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->openConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 317
    :cond_4
    invoke-interface {p4}, Ljava/lang/Runnable;->run()V

    if-nez v1, :cond_5

    if-eqz v2, :cond_6

    .line 320
    :cond_5
    iget-object p4, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    new-instance v0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$2;

    invoke-direct {v0, p0, v2, v1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$2;-><init>(Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;ZZ)V

    invoke-interface {p4, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->closeConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_6
    :goto_0
    if-eqz p2, :cond_7

    .line 334
    iget-object p4, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {p4}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->unIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_7
    if-eqz p3, :cond_8

    .line 337
    iget-boolean p3, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressCloseTagLine:Z

    if-nez p3, :cond_8

    iget-object p3, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {p3}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 339
    :cond_8
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    if-eqz p2, :cond_9

    .line 341
    iget-boolean p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressCloseTagLine:Z

    if-nez p1, :cond_9

    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_9
    return-object p0
.end method

.method protected tagClosed(Ljava/lang/CharSequence;)V
    .locals 0

    .line 201
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->popTag(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public bridge synthetic tagIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tagIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public tagIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/Runnable;",
            ")TT;"
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 372
    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tag(Ljava/lang/CharSequence;ZZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-object p0
.end method

.method public bridge synthetic tagLine(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tagLine(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic tagLine(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tagLine(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic tagLine(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tagLine(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public tagLine(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    .line 354
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressOpenTagLine:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressCloseTagLine:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-object p0
.end method

.method public tagLine(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/Runnable;",
            ")TT;"
        }
    .end annotation

    .line 366
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressOpenTagLine:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, v1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tag(Ljava/lang/CharSequence;ZZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    iget-boolean p2, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressCloseTagLine:Z

    xor-int/lit8 p2, p2, 0x1

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-object p0
.end method

.method public tagLine(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Z)TT;"
        }
    .end annotation

    .line 360
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressOpenTagLine:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    iget-boolean p2, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressCloseTagLine:Z

    xor-int/lit8 p2, p2, 0x1

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-object p0
.end method

.method public bridge synthetic tagLineIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tagLineIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public tagLineIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/Runnable;",
            ")TT;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 378
    invoke-virtual {p0, p1, v0, v0, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tag(Ljava/lang/CharSequence;ZZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-object p0
.end method

.method protected tagOpened(Ljava/lang/CharSequence;)V
    .locals 0

    .line 197
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->pushTag(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public bridge synthetic tagVoid(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tagVoid(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public tagVoid(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 177
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic tagVoidLine(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tagVoidLine(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public tagVoidLine(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    .line 348
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressOpenTagLine:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tagVoid(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->suppressCloseTagLine:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-object p0
.end method

.method public bridge synthetic text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    return-object p1
.end method

.method public text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TT;"
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/vladsch/flexmark/util/html/Escaping;->escapeHtml(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic unIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->unIndent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public unIndent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 450
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->unIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic willIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->willIndent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public willIndent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 445
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->out:Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->willIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public bridge synthetic withAttr()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withAttr()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public withAttr()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 143
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withAttributes:Z

    return-object p0
.end method

.method public bridge synthetic withCondIndent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withCondIndent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public withCondIndent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 166
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->indentIndentingChildren:Z

    return-object p0
.end method

.method public bridge synthetic withCondLine()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withCondLine()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    return-object v0
.end method

.method public withCondLine()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 160
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->lineOnChildText:Z

    return-object p0
.end method
