.class public Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;
.super Ljava/lang/Object;
.source "FormattingAppendableImpl.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/html/FormattingAppendable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final myAfterEolRunnables:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;>;"
        }
    .end annotation
.end field

.field private final myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

.field private final myConditionalFrames:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;",
            ">;"
        }
    .end annotation
.end field

.field private final myEOL:C

.field private myEolOptions:I

.field private myIOException:Ljava/io/IOException;

.field private myIndent:I

.field private final myIndentLineCounts:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private myIndentOffset:I

.field private myIndentPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private myLastEOLCount:I

.field private myLastEOLOffset:I

.field private myLineCount:I

.field private myModCount:I

.field private myModCountOfLastEOL:I

.field private myOffsetBefore:I

.field private final myOffsetBeforeList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private myOptions:I

.field private myPassThrough:Z

.field private myPendingEOL:I

.field private myPendingPreFormattedPrefix:Z

.field private myPendingSpaces:I

.field private myPreFormattedNesting:I

.field private myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private final myPrefixStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation
.end field

.field private mySpacesAfterEOL:I

.field private myWhitespace:Ljava/lang/String;

.field private myWhitespaceEOL:Ljava/lang/String;

.field private myWillIndent:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, v0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;-><init>(Ljava/lang/Appendable;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Appendable;I)V
    .locals 1

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-instance v0, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendableImpl;-><init>(Ljava/lang/Appendable;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    .line 70
    new-instance p1, Ljava/util/Stack;

    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myConditionalFrames:Ljava/util/Stack;

    .line 71
    new-instance p1, Ljava/util/Stack;

    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentLineCounts:Ljava/util/Stack;

    .line 72
    new-instance p1, Ljava/util/Stack;

    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefixStack:Ljava/util/Stack;

    .line 73
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOffsetBeforeList:Ljava/util/ArrayList;

    .line 74
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAfterEolRunnables:Ljava/util/HashMap;

    const/16 p1, 0xa

    .line 75
    iput-char p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myEOL:C

    .line 76
    iput p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOptions:I

    const/4 p1, 0x0

    .line 77
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIOException:Ljava/io/IOException;

    const/4 p1, 0x0

    .line 78
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    .line 79
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOffsetBefore:I

    .line 80
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    .line 81
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingPreFormattedPrefix:Z

    .line 82
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    .line 83
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCountOfLastEOL:I

    .line 84
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLastEOLCount:I

    .line 85
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    .line 86
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myWillIndent:Z

    .line 87
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentOffset:I

    .line 88
    sget-object p2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 89
    sget-object p2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 90
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    .line 91
    iget p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOptions:I

    iput p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myEolOptions:I

    .line 92
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->mySpacesAfterEOL:I

    const/16 p1, 0x10

    .line 93
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->haveOptions(I)Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPassThrough:Z

    .line 95
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->updateLastEolOffset()V

    .line 96
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setWhitespace()V

    return-void
.end method

.method static synthetic access$002(Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 15
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1
.end method

.method private addPendingSpaces(I)V
    .locals 2

    if-lez p1, :cond_3

    .line 160
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    if-nez v0, :cond_3

    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCountOfLastEOL:I

    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->isAllowLeadingWhitespace()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 161
    :cond_1
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->isCollapseWhitespace()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 162
    iget p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingSpaces:I

    if-nez p1, :cond_3

    const/4 p1, 0x1

    .line 163
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingSpaces:I

    return-void

    .line 166
    :cond_2
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingSpaces:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingSpaces:I

    :cond_3
    return-void
.end method

.method private appendEOL(ZZ)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 243
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    .line 244
    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-lez v1, :cond_2

    .line 245
    iget p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingSpaces:I

    if-lez p2, :cond_0

    const/4 p2, 0x4

    invoke-direct {p0, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->haveEolOptions(I)Z

    move-result p2

    if-nez p2, :cond_0

    .line 246
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendSpaces()V

    .line 249
    :cond_0
    :goto_0
    iget p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-lez p2, :cond_1

    .line 250
    iget-object p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    iget-char v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myEOL:C

    invoke-interface {p2, v1}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(C)Ljava/lang/Appendable;

    .line 251
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->updateLastEolOffset()V

    .line 252
    iget p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    add-int/lit8 p2, p2, 0x1

    iput p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    .line 253
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->runAllAfterEol()V

    .line 254
    iget p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-lez p2, :cond_0

    .line 256
    iget-object p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result p2

    if-nez p2, :cond_0

    .line 257
    iget-object p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p2, v1}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_0

    .line 261
    :cond_1
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->resetPendingEOL()V

    .line 262
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->runAllAfterEol()V

    .line 265
    iget p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->mySpacesAfterEOL:I

    invoke-direct {p0, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendSpaces(I)V

    const/4 p2, 0x0

    .line 266
    iput p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->mySpacesAfterEOL:I

    if-eqz p1, :cond_5

    .line 268
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendIndent()V

    goto :goto_1

    .line 270
    :cond_2
    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCountOfLastEOL:I

    iget v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    if-ne v1, v2, :cond_4

    .line 271
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->isAllowLeadingWhitespace()Z

    move-result v1

    if-eqz v1, :cond_3

    if-eqz p2, :cond_3

    .line 272
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendSpaces()V

    :cond_3
    if-eqz p1, :cond_5

    .line 274
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendIndent()V

    goto :goto_1

    :cond_4
    if-eqz p2, :cond_5

    .line 277
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendSpaces()V

    .line 281
    :cond_5
    :goto_1
    iget p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLastEOLCount:I

    return-void
.end method

.method private appendImpl(C)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 356
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPassThrough:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 358
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    add-int/lit8 v3, v0, -0x1

    iput v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-lez v0, :cond_0

    .line 359
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    const/16 v3, 0xa

    invoke-interface {v0, v3}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(C)Ljava/lang/Appendable;

    .line 361
    :cond_0
    iput v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    .line 362
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    .line 363
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(C)Ljava/lang/Appendable;

    return-void

    .line 367
    :cond_1
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    if-lez v0, :cond_4

    .line 368
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->getLength()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setOffsetBefore(I)V

    .line 370
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->beforePre()V

    .line 372
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingPreFormattedPrefix:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 373
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, v3}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 375
    :cond_2
    iput-boolean v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingPreFormattedPrefix:Z

    .line 377
    iget-char v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myEOL:C

    if-ne p1, v0, :cond_3

    .line 378
    iput v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    .line 379
    iput-boolean v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingPreFormattedPrefix:Z

    .line 380
    iput v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->mySpacesAfterEOL:I

    return-void

    .line 382
    :cond_3
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(C)Ljava/lang/Appendable;

    .line 383
    iget p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    .line 384
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->resetPendingEOL()V

    return-void

    .line 387
    :cond_4
    iget-char v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myEOL:C

    if-ne p1, v0, :cond_5

    .line 388
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setPendingEOLRaw(I)V

    return-void

    .line 390
    :cond_5
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myWhitespace:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6

    .line 391
    invoke-direct {p0, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->addPendingSpaces(I)V

    return-void

    .line 393
    :cond_6
    invoke-direct {p0, v2, v2, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->beforeAppendText(ZZZ)V

    .line 394
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->getLength()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setOffsetBefore(I)V

    .line 395
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(C)Ljava/lang/Appendable;

    .line 396
    iget p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    return-void
.end method

.method private appendImpl(Ljava/lang/CharSequence;II)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 403
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPassThrough:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 405
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    add-int/lit8 v3, v0, -0x1

    iput v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-lez v0, :cond_0

    .line 407
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    const/16 v3, 0xa

    invoke-interface {v0, v3}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(C)Ljava/lang/Appendable;

    .line 411
    :cond_0
    iput v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    .line 412
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    .line 413
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;

    return-void

    .line 418
    :cond_1
    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 420
    iget v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    const/4 v4, -0x1

    if-lez v3, :cond_8

    .line 421
    iget-object v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->getLength()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setOffsetBefore(I)V

    .line 422
    invoke-interface {v0, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    const-string v5, "\n"

    invoke-interface {v3, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->removeSuffix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v3

    add-int/2addr v3, p2

    if-ge p2, p3, :cond_2

    .line 425
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->beforePre()V

    :cond_2
    :goto_0
    if-ge p2, v3, :cond_7

    .line 429
    iget-char v5, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myEOL:C

    invoke-interface {v0, v5, p2, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(CII)I

    move-result v5

    if-ne v5, v4, :cond_3

    move v6, v3

    goto :goto_1

    :cond_3
    add-int/lit8 v6, v5, 0x1

    :goto_1
    if-ge p2, v6, :cond_5

    .line 433
    iget-boolean v7, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingPreFormattedPrefix:Z

    if-eqz v7, :cond_4

    iget-object v7, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4

    .line 434
    iget-object v7, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    iget-object v8, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v7, v8}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 436
    :cond_4
    iput-boolean v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingPreFormattedPrefix:Z

    .line 438
    iget-object v7, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v7, p1, p2, v6}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;

    move p2, v6

    :cond_5
    if-ne v5, v4, :cond_6

    goto :goto_2

    .line 444
    :cond_6
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->updateLastEolOffset()V

    .line 445
    iget p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    add-int/2addr p2, v2

    iput p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    .line 446
    iput-boolean v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingPreFormattedPrefix:Z

    move p2, v6

    goto :goto_0

    .line 449
    :cond_7
    :goto_2
    iget p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    if-ne p2, v3, :cond_11

    if-eq v3, p3, :cond_11

    .line 453
    iput v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    .line 454
    iput-boolean v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingPreFormattedPrefix:Z

    .line 455
    iput v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->mySpacesAfterEOL:I

    return-void

    :cond_8
    const/4 v3, 0x1

    :goto_3
    if-ge p2, p3, :cond_11

    .line 461
    iget-object v5, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myWhitespaceEOL:Ljava/lang/String;

    invoke-interface {v0, v5, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOfAny(Ljava/lang/CharSequence;II)I

    move-result v5

    if-ne v5, v4, :cond_9

    move v6, p3

    goto :goto_4

    :cond_9
    move v6, v5

    :goto_4
    if-ge p2, v6, :cond_b

    .line 467
    invoke-direct {p0, v2, v2, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->beforeAppendText(ZZZ)V

    if-eqz v3, :cond_a

    .line 469
    iget-object v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->getLength()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setOffsetBefore(I)V

    const/4 v3, 0x0

    .line 472
    :cond_a
    iget-object v7, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v7, p1, p2, v6}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;

    .line 473
    iget p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    add-int/2addr p2, v2

    iput p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    :cond_b
    if-ne v5, v4, :cond_c

    goto :goto_6

    .line 479
    :cond_c
    iget-object p2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myWhitespaceEOL:Ljava/lang/String;

    invoke-interface {v0, p2, v5, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->countLeading(Ljava/lang/CharSequence;II)I

    move-result p2

    .line 480
    iget v6, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-nez v6, :cond_f

    .line 481
    iget-char v6, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myEOL:C

    add-int v7, v5, p2

    invoke-interface {v0, v6, v5, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(CII)I

    move-result v6

    if-eq v6, v4, :cond_e

    if-le v6, v5, :cond_d

    const/4 v7, 0x4

    .line 484
    invoke-direct {p0, v7}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->haveOptions(I)Z

    move-result v7

    if-nez v7, :cond_d

    sub-int/2addr v6, v5

    invoke-direct {p0, v6}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->addPendingSpaces(I)V

    .line 485
    :cond_d
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setPendingEOLRaw(I)V

    goto :goto_5

    .line 488
    :cond_e
    invoke-direct {p0, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->addPendingSpaces(I)V

    goto :goto_5

    .line 492
    :cond_f
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->isAllowLeadingWhitespace()Z

    move-result v6

    if-eqz v6, :cond_10

    iget v6, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->mySpacesAfterEOL:I

    add-int/2addr v6, p2

    iput v6, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->mySpacesAfterEOL:I

    :cond_10
    :goto_5
    add-int/2addr p2, v5

    goto :goto_3

    :cond_11
    :goto_6
    return-void
.end method

.method private appendIndent()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 147
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 151
    :cond_0
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentOffset:I

    add-int/2addr v0, v1

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 152
    :goto_0
    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    iget v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentOffset:I

    add-int/2addr v1, v2

    if-ge v0, v1, :cond_1

    .line 153
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1, v2}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private appendPretendColumn(Ljava/lang/CharSequence;II)I
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    .line 503
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->column()I

    move-result v3

    .line 504
    iget-boolean v4, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingPreFormattedPrefix:Z

    .line 505
    iget v5, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingSpaces:I

    .line 506
    iget v6, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->mySpacesAfterEOL:I

    .line 508
    iget-object v7, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v7

    .line 509
    iget-boolean v8, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPassThrough:Z

    if-eqz v8, :cond_2

    .line 510
    iget v1, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-lez v1, :cond_1

    if-eqz v4, :cond_0

    .line 512
    iget-object v1, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v7, 0x0

    :goto_0
    return v7

    :cond_1
    return v3

    .line 521
    :cond_2
    invoke-static/range {p1 .. p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v8

    .line 523
    iget v10, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    const/4 v11, -0x1

    if-lez v10, :cond_a

    .line 524
    invoke-interface {v8, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    const-string v6, "\n"

    invoke-interface {v5, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->removeSuffix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-interface {v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v5

    add-int/2addr v5, v1

    if-ge v1, v2, :cond_4

    if-eqz v4, :cond_3

    add-int/2addr v3, v7

    :cond_3
    const/4 v4, 0x0

    :cond_4
    :goto_1
    if-ge v1, v5, :cond_9

    .line 534
    iget-char v2, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myEOL:C

    invoke-interface {v8, v2, v1, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(CII)I

    move-result v2

    if-ne v2, v11, :cond_5

    move v6, v5

    goto :goto_2

    :cond_5
    add-int/lit8 v6, v2, 0x1

    :goto_2
    if-ge v1, v6, :cond_7

    if-eqz v4, :cond_6

    add-int/2addr v3, v7

    :cond_6
    sub-int v1, v6, v1

    add-int/2addr v3, v1

    :cond_7
    if-ne v2, v11, :cond_8

    goto :goto_3

    :cond_8
    move v1, v6

    const/4 v4, 0x1

    goto :goto_1

    :cond_9
    :goto_3
    return v3

    :cond_a
    const/4 v4, 0x1

    :goto_4
    if-ge v1, v2, :cond_1b

    .line 561
    iget-object v10, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myWhitespaceEOL:Ljava/lang/String;

    invoke-interface {v8, v10, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOfAny(Ljava/lang/CharSequence;II)I

    move-result v10

    if-ne v10, v11, :cond_b

    move v13, v2

    goto :goto_5

    :cond_b
    move v13, v10

    :goto_5
    if-ge v1, v13, :cond_13

    .line 569
    iget-object v14, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v14}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v14

    iget v15, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    iget v9, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentOffset:I

    add-int v16, v15, v9

    mul-int v14, v14, v16

    add-int/2addr v15, v9

    if-lez v15, :cond_c

    .line 570
    iget-object v9, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v9}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_c

    const/4 v9, 0x1

    goto :goto_6

    :cond_c
    const/4 v9, 0x0

    .line 571
    :goto_6
    iget v15, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-lez v15, :cond_e

    .line 574
    iget-object v3, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_d

    move v3, v7

    goto :goto_7

    :cond_d
    const/4 v3, 0x0

    :goto_7
    if-eqz v9, :cond_11

    :goto_8
    add-int/2addr v3, v14

    goto :goto_9

    .line 582
    :cond_e
    iget v15, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCountOfLastEOL:I

    iget v12, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    if-ne v15, v12, :cond_10

    .line 583
    iget-object v12, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v12}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_f

    add-int/2addr v3, v7

    :cond_f
    if-eqz v9, :cond_11

    goto :goto_8

    :cond_10
    if-lez v5, :cond_11

    add-int/2addr v3, v5

    :cond_11
    :goto_9
    if-eqz v4, :cond_12

    const/4 v4, 0x0

    :cond_12
    sub-int/2addr v13, v1

    add-int/2addr v3, v13

    :cond_13
    if-ne v10, v11, :cond_14

    return v3

    .line 605
    :cond_14
    iget-object v1, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myWhitespaceEOL:Ljava/lang/String;

    invoke-interface {v8, v1, v10, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->countLeading(Ljava/lang/CharSequence;II)I

    move-result v1

    .line 606
    iget v9, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-nez v9, :cond_19

    .line 607
    iget-char v9, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myEOL:C

    add-int v12, v10, v1

    invoke-interface {v8, v9, v10, v12}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(CII)I

    move-result v9

    .line 608
    iget v12, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    if-nez v12, :cond_15

    iget v12, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-nez v12, :cond_15

    iget v12, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCountOfLastEOL:I

    iget v13, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    if-eq v12, v13, :cond_15

    const/4 v12, 0x1

    goto :goto_a

    :cond_15
    const/4 v12, 0x0

    :goto_a
    if-eq v9, v11, :cond_17

    if-le v9, v10, :cond_1a

    const/4 v13, 0x4

    .line 612
    invoke-direct {v0, v13}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->haveOptions(I)Z

    move-result v13

    if-nez v13, :cond_1a

    sub-int/2addr v9, v10

    if-lez v9, :cond_1a

    if-eqz v12, :cond_1a

    .line 617
    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->isCollapseWhitespace()Z

    move-result v12

    if-eqz v12, :cond_16

    if-nez v5, :cond_1a

    :goto_b
    const/4 v5, 0x1

    goto :goto_c

    :cond_16
    add-int/2addr v5, v9

    goto :goto_c

    :cond_17
    if-lez v1, :cond_1a

    if-eqz v12, :cond_1a

    .line 633
    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->isCollapseWhitespace()Z

    move-result v9

    if-eqz v9, :cond_18

    if-nez v5, :cond_1a

    goto :goto_b

    :cond_18
    add-int/2addr v5, v1

    goto :goto_c

    .line 645
    :cond_19
    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->isAllowLeadingWhitespace()Z

    move-result v9

    if-eqz v9, :cond_1a

    add-int/2addr v3, v6

    const/4 v6, 0x0

    :cond_1a
    :goto_c
    add-int/2addr v1, v10

    goto/16 :goto_4

    :cond_1b
    return v3
.end method

.method private appendSpaces()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 173
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingSpaces:I

    if-lez v0, :cond_0

    .line 175
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendSpaces(I)V

    const/4 v0, 0x0

    .line 177
    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingSpaces:I

    .line 178
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    :cond_0
    return-void
.end method

.method private appendSpaces(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    if-lez p1, :cond_0

    .line 184
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(C)Ljava/lang/Appendable;

    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private beforeAppendText(ZZZ)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 290
    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLastEOLCount:I

    .line 291
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myConditionalFrames:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v1

    if-lez v1, :cond_8

    .line 293
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myConditionalFrames:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;

    .line 294
    iget-boolean v2, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myInFormatter:Z

    if-nez v2, :cond_8

    .line 296
    iget v2, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myModCount:I

    iget v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    const/4 v4, 0x1

    if-ne v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_1

    add-int/2addr v3, v4

    .line 298
    iput v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    :cond_1
    if-nez v2, :cond_2

    .line 301
    iget-boolean v3, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myOnIndent:Z

    if-nez v3, :cond_8

    iget-boolean v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myWillIndent:Z

    if-nez v3, :cond_2

    iget v3, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myIndent:I

    iget v5, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    if-ge v3, v5, :cond_8

    .line 302
    :cond_2
    iput-boolean v4, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myInFormatter:Z

    .line 304
    iget-boolean v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myWillIndent:Z

    if-nez v3, :cond_4

    iget v3, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myIndent:I

    iget v5, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    if-ge v3, v5, :cond_3

    goto :goto_1

    :cond_3
    const/4 v3, 0x0

    goto :goto_2

    :cond_4
    :goto_1
    const/4 v3, 0x1

    :goto_2
    iput-boolean v3, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myOnIndent:Z

    .line 305
    iget v3, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myLineCount:I

    iget v5, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    iget v6, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    add-int/2addr v5, v6

    if-ge v3, v5, :cond_5

    const/4 v3, 0x1

    goto :goto_3

    :cond_5
    const/4 v3, 0x0

    :goto_3
    iput-boolean v3, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myOnLine:Z

    .line 306
    iget v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    .line 308
    iget v5, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myIndent:I

    iput v5, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    .line 310
    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    .line 311
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->runAllAfterEol()V

    .line 312
    iget v5, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    .line 314
    iget-object v6, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myOpenFormatter:Lcom/vladsch/flexmark/util/html/ConditionalFormatter;

    iget-boolean v7, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myOnIndent:Z

    iget-boolean v8, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myOnLine:Z

    invoke-interface {v6, v2, v7, v8, v4}, Lcom/vladsch/flexmark/util/html/ConditionalFormatter;->apply(ZZZZ)V

    .line 317
    iget v6, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    iget v7, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myIndent:I

    sub-int/2addr v3, v7

    add-int/2addr v6, v3

    iput v6, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    .line 320
    iget-object v3, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myLineRef:Lcom/vladsch/flexmark/util/Ref;

    if-eqz v3, :cond_7

    if-eqz v2, :cond_7

    iget-object v2, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myLineRef:Lcom/vladsch/flexmark/util/Ref;

    iget v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    if-eq v5, v3, :cond_6

    goto :goto_4

    :cond_6
    const/4 v4, 0x0

    :goto_4
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, v2, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    .line 322
    :cond_7
    iput-boolean v0, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myInFormatter:Z

    :cond_8
    if-eqz p1, :cond_9

    .line 327
    invoke-direct {p0, p2, p3}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendEOL(ZZ)V

    return-void

    :cond_9
    if-eqz p3, :cond_a

    .line 328
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendSpaces()V

    :cond_a
    return-void
.end method

.method private beforePre()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 343
    :goto_0
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-lez v0, :cond_1

    .line 344
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    const/16 v1, 0xa

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(C)Ljava/lang/Appendable;

    .line 345
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->updateLastEolOffset()V

    .line 346
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    .line 347
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingPreFormattedPrefix:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 348
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 350
    :cond_0
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 352
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingPreFormattedPrefix:Z

    return-void
.end method

.method private haveEolOptions(I)Z
    .locals 1

    .line 123
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myEolOptions:I

    and-int/2addr p1, v0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private haveOptions(I)Z
    .locals 1

    .line 119
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOptions:I

    and-int/2addr p1, v0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private isAllowLeadingWhitespace()Z
    .locals 1

    const/16 v0, 0x20

    .line 135
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->haveOptions(I)Z

    move-result v0

    return v0
.end method

.method private isCollapseWhitespace()Z
    .locals 1

    const/4 v0, 0x2

    .line 139
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->haveOptions(I)Z

    move-result v0

    return v0
.end method

.method private isConvertingTabs()Z
    .locals 1

    const/4 v0, 0x3

    .line 127
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->haveOptions(I)Z

    move-result v0

    return v0
.end method

.method private isPrefixAfterPendingEol()Z
    .locals 1

    const/16 v0, 0x8

    .line 143
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->haveOptions(I)Z

    move-result v0

    return v0
.end method

.method private isSuppressingTrailingWhitespace()Z
    .locals 1

    const/4 v0, 0x4

    .line 131
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->haveOptions(I)Z

    move-result v0

    return v0
.end method

.method private resetPendingEOL()V
    .locals 1

    const/4 v0, 0x0

    .line 215
    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    .line 216
    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingSpaces:I

    .line 217
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCountOfLastEOL:I

    .line 218
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOptions:I

    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myEolOptions:I

    return-void
.end method

.method private runAllAfterEol()V
    .locals 2

    .line 233
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAfterEolRunnables:Ljava/util/HashMap;

    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_1

    .line 235
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 236
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 238
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAfterEolRunnables:Ljava/util/HashMap;

    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method private setIOException(Ljava/io/IOException;)V
    .locals 1

    .line 665
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIOException:Ljava/io/IOException;

    if-nez v0, :cond_0

    .line 666
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIOException:Ljava/io/IOException;

    :cond_0
    return-void
.end method

.method private setOffsetBefore(I)V
    .locals 3

    .line 332
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOffsetBefore:I

    .line 333
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOffsetBeforeList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 334
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOffsetBeforeList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/Ref;

    .line 335
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, v1, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    goto :goto_0

    .line 338
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOffsetBeforeList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_1
    return-void
.end method

.method private setWhitespace()V
    .locals 1

    .line 100
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->isConvertingTabs()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, " \t"

    goto :goto_0

    :cond_0
    const-string v0, " "

    :goto_0
    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myWhitespace:Ljava/lang/String;

    .line 101
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->isConvertingTabs()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, " \t\r\n"

    goto :goto_1

    :cond_1
    const-string v0, " \n"

    :goto_1
    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myWhitespaceEOL:Ljava/lang/String;

    return-void
.end method

.method private updateLastEolOffset()V
    .locals 1

    .line 285
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->getLength()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLastEOLOffset:I

    return-void
.end method


# virtual methods
.method public bridge synthetic addAfterEolRunnable(ILjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->addAfterEolRunnable(ILjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;

    move-result-object p1

    return-object p1
.end method

.method public addAfterEolRunnable(ILjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;
    .locals 2

    .line 223
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAfterEolRunnables:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_0

    .line 225
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 226
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAfterEolRunnables:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addLine()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 846
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setPendingEOLRaw(I)V

    return-object p0
.end method

.method public addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 3

    .line 814
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/CharSequence;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->append([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0
.end method

.method public append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 693
    :try_start_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIOException:Ljava/io/IOException;

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendImpl(C)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    .line 695
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setIOException(Ljava/io/IOException;)V

    :cond_0
    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 2

    .line 673
    :try_start_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIOException:Ljava/io/IOException;

    if-nez v0, :cond_0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendImpl(Ljava/lang/CharSequence;II)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    .line 675
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setIOException(Ljava/io/IOException;)V

    :cond_0
    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 683
    :try_start_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIOException:Ljava/io/IOException;

    if-nez v0, :cond_0

    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendImpl(Ljava/lang/CharSequence;II)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    .line 685
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setIOException(Ljava/io/IOException;)V

    :cond_0
    return-object p0
.end method

.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

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

    .line 15
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

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

    .line 15
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object p1

    return-object p1
.end method

.method public blankLine()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    const/4 v0, 0x2

    .line 882
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setPendingEOLRaw(I)V

    return-object p0
.end method

.method public blankLine(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    if-lez p1, :cond_0

    add-int/lit8 p1, p1, 0x1

    .line 894
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setPendingEOLRaw(I)V

    :cond_0
    return-object p0
.end method

.method public blankLineIf(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    if-eqz p1, :cond_0

    .line 888
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->blankLine()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_0
    return-object p0
.end method

.method public closeConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 5

    .line 1049
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myConditionalFrames:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    if-eqz v0, :cond_1

    .line 1051
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myConditionalFrames:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;

    .line 1053
    iget-boolean v1, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myOnIndent:Z

    iget-boolean v2, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myOnLine:Z

    iget v0, v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myModCount:I

    iget v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    const/4 v4, 0x1

    if-eq v0, v3, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-interface {p1, v4, v1, v2, v0}, Lcom/vladsch/flexmark/util/html/ConditionalFormatter;->apply(ZZZZ)V

    return-object p0

    .line 1049
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closeConditional called with no conditionals open"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public closePreFormatted()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 2

    .line 1009
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    if-lez v0, :cond_0

    const/4 v1, 0x0

    .line 1010
    iput-boolean v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingPreFormattedPrefix:Z

    add-int/lit8 v0, v0, -0x1

    .line 1011
    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    return-object p0

    .line 1009
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closePreFormatted called with nesting == 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public column()I
    .locals 2

    .line 981
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->getLength()I

    move-result v0

    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLastEOLOffset:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public columnWith(Ljava/lang/CharSequence;II)I
    .locals 0

    .line 986
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendPretendColumn(Ljava/lang/CharSequence;II)I

    move-result p1

    return p1
.end method

.method public flush()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    const/4 v0, 0x0

    .line 739
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->flush(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object v0

    return-object v0
.end method

.method public flush(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 2

    const/4 v0, -0x1

    if-lt p1, v0, :cond_0

    move v0, p1

    .line 758
    :cond_0
    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    add-int/lit8 v0, v0, 0x1

    if-le v1, v0, :cond_1

    add-int/lit8 p1, p1, 0x1

    .line 759
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    .line 763
    :cond_1
    :try_start_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIOException:Ljava/io/IOException;

    if-nez p1, :cond_2

    .line 764
    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->getLength()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOffsetBefore:I

    const/4 p1, 0x0

    .line 765
    invoke-direct {p0, p1, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendEOL(ZZ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    .line 768
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setIOException(Ljava/io/IOException;)V

    :cond_2
    return-object p0
.end method

.method public flushWhitespaces()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 745
    :try_start_0
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->appendSpaces()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    .line 747
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setIOException(Ljava/io/IOException;)V

    return-object p0
.end method

.method public getAppendable()Ljava/lang/Appendable;
    .locals 1

    .line 720
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    return-object v0
.end method

.method public getIOException()Ljava/io/IOException;
    .locals 1

    .line 661
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIOException:Ljava/io/IOException;

    return-object v0
.end method

.method public getIndent()I
    .locals 2

    .line 900
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentOffset:I

    add-int/2addr v0, v1

    return v0
.end method

.method public getIndentPrefix()Ljava/lang/CharSequence;
    .locals 1

    .line 775
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getLineCount()I
    .locals 1

    .line 955
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    return v0
.end method

.method public getModCount()I
    .locals 1

    .line 950
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    return v0
.end method

.method public getOptions()I
    .locals 1

    .line 106
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOptions:I

    return v0
.end method

.method public getPendingEOL()I
    .locals 1

    .line 1032
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    return v0
.end method

.method public getPendingSpace()I
    .locals 1

    .line 1022
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingSpaces:I

    return v0
.end method

.method public getPrefix()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 786
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public bridge synthetic getPrefix()Ljava/lang/CharSequence;
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->getPrefix()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public getPushedPrefixCount()I
    .locals 1

    .line 835
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefixStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 725
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->flush()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getAppendable()Ljava/lang/Appendable;

    move-result-object v0

    .line 726
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getText(I)Ljava/lang/String;
    .locals 0

    .line 732
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->flush(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->getAppendable()Ljava/lang/Appendable;

    move-result-object p1

    .line 733
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTotalIndentPrefix()Ljava/lang/CharSequence;
    .locals 3

    .line 791
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 792
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    invoke-static {v1, v2}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 793
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public indent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 2

    .line 911
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    if-nez v0, :cond_1

    .line 913
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPassThrough:Z

    if-nez v0, :cond_0

    .line 914
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    .line 915
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentLineCounts:Ljava/util/Stack;

    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const/4 v0, 0x0

    .line 918
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myWillIndent:Z

    .line 919
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    return-object p0

    .line 911
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "indent should not be called inside preFormatted"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isPendingEOL()Z
    .locals 1

    .line 1027
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPendingSpace()Z
    .locals 1

    .line 1017
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingSpaces:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPreFormatted()Z
    .locals 1

    .line 1037
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public lastOffset()I
    .locals 1

    .line 966
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOffsetBefore:I

    return v0
.end method

.method public lastOffset(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/vladsch/flexmark/util/html/FormattingAppendable;"
        }
    .end annotation

    .line 960
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOffsetBeforeList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    const/4 v0, 0x1

    .line 840
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setPendingEOLRaw(I)V

    return-object p0
.end method

.method public line(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/vladsch/flexmark/util/html/FormattingAppendable;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 859
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p1, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    .line 860
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myConditionalFrames:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 862
    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myConditionalFrames:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;

    .line 863
    iget v2, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myModCount:I

    iget v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    if-ne v2, v3, :cond_1

    .line 866
    iget-object v2, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myLineRef:Lcom/vladsch/flexmark/util/Ref;

    if-eqz v2, :cond_0

    iget-object v2, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myLineRef:Lcom/vladsch/flexmark/util/Ref;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, v2, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    .line 867
    :cond_0
    iput-object p1, v1, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;->myLineRef:Lcom/vladsch/flexmark/util/Ref;

    .line 870
    :cond_1
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setPendingEOLRaw(I)V

    return-object p0
.end method

.method public lineIf(Lcom/vladsch/flexmark/util/Ref;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Ref<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/vladsch/flexmark/util/html/FormattingAppendable;"
        }
    .end annotation

    .line 876
    iget-object p1, p1, Lcom/vladsch/flexmark/util/Ref;->value:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_0
    return-object p0
.end method

.method public lineIf(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    if-eqz p1, :cond_0

    .line 852
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_0
    return-object p0
.end method

.method public offset()I
    .locals 1

    .line 971
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->getLength()I

    move-result v0

    return v0
.end method

.method public offsetWithPending()I
    .locals 4

    .line 976
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->getLength()I

    move-result v0

    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCountOfLastEOL:I

    iget v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    const/4 v3, 0x0

    if-ne v1, v2, :cond_0

    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->haveOptions(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingSpaces:I

    :goto_0
    add-int/2addr v0, v1

    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    add-int/2addr v0, v1

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v3

    :cond_1
    add-int/2addr v0, v3

    return v0
.end method

.method public openConditional(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 4

    .line 1042
    new-instance v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;

    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    iget v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    iget v3, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$ConditionalFrame;-><init>(Lcom/vladsch/flexmark/util/html/ConditionalFormatter;III)V

    .line 1043
    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myConditionalFrames:Ljava/util/Stack;

    invoke-virtual {p1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public openPreFormatted(Z)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 992
    :try_start_0
    iget-object v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->getLength()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setOffsetBefore(I)V

    if-nez p1, :cond_1

    .line 994
    iget v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-lez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iput-boolean v2, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingPreFormattedPrefix:Z

    .line 996
    :cond_1
    invoke-direct {p0, v0, p1, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->beforeAppendText(ZZZ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 998
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setIOException(Ljava/io/IOException;)V

    .line 1000
    :goto_1
    iput v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingSpaces:I

    .line 1001
    iput v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    .line 1002
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->runAllAfterEol()V

    .line 1003
    iget p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    return-object p0
.end method

.method public popPrefix()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 2

    .line 826
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefixStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 828
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefixStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 829
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-object p0

    .line 826
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "popPrefix with an empty stack"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public pushPrefix()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 2

    .line 820
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefixStack:Ljava/util/Stack;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public repeat(CI)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    :goto_0
    add-int/lit8 v0, p2, -0x1

    if-lez p2, :cond_0

    .line 702
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move p2, v0

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public repeat(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    :goto_0
    add-int/lit8 v0, p2, -0x1

    if-lez p2, :cond_0

    .line 708
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move p2, v0

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public repeat(Ljava/lang/CharSequence;III)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    :goto_0
    add-int/lit8 v0, p4, -0x1

    if-lez p4, :cond_0

    .line 714
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move p4, v0

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public setIndentOffset(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 905
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentOffset:I

    return-object p0
.end method

.method public setIndentPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 780
    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0
.end method

.method public setOptions(I)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 111
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOptions:I

    const/16 p1, 0x10

    .line 112
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->haveOptions(I)Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPassThrough:Z

    .line 114
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->setWhitespace()V

    return-object p0
.end method

.method public setPendingEOL(I)V
    .locals 0

    .line 211
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    return-void
.end method

.method public setPendingEOLRaw(I)V
    .locals 2

    .line 190
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPassThrough:Z

    if-eqz v0, :cond_0

    .line 191
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myAppendable:Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/html/LengthTrackingAppendable;->getLength()I

    move-result v0

    if-lez v0, :cond_2

    .line 192
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    goto :goto_0

    .line 195
    :cond_0
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    if-nez v0, :cond_2

    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-le p1, v0, :cond_2

    .line 196
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCountOfLastEOL:I

    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myModCount:I

    if-eq v0, v1, :cond_1

    .line 197
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    .line 198
    iget p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOptions:I

    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myEolOptions:I

    goto :goto_0

    .line 199
    :cond_1
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    if-lez v0, :cond_2

    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLastEOLCount:I

    if-le p1, v0, :cond_2

    sub-int/2addr p1, v0

    .line 200
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    .line 201
    iget p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myOptions:I

    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myEolOptions:I

    :cond_2
    :goto_0
    const/4 p1, 0x0

    .line 206
    iput p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->mySpacesAfterEOL:I

    return-void
.end method

.method public setPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    .line 798
    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    .line 799
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    if-lez v0, :cond_0

    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->isPrefixAfterPendingEol()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 800
    new-instance v0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$1;

    invoke-direct {v0, p0, p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl$1;-><init>(Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;Lcom/vladsch/flexmark/util/sequence/CharSubSequence;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->addAfterEolRunnable(ILjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;

    return-object p0

    .line 807
    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPrefix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0
.end method

.method public unIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 2

    .line 931
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    if-lez v0, :cond_3

    .line 933
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPassThrough:Z

    if-nez v0, :cond_2

    .line 934
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPreFormattedNesting:I

    if-nez v0, :cond_1

    .line 936
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndentLineCounts:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 937
    iget v1, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myLineCount:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 938
    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myPendingEOL:I

    .line 939
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->runAllAfterEol()V

    goto :goto_0

    .line 941
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    goto :goto_0

    .line 934
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "unIndent should not be called inside preFormatted"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 944
    :cond_2
    :goto_0
    iget v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myIndent:I

    return-object p0

    .line 931
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "unIndent called with nesting == 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public willIndent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 1

    const/4 v0, 0x1

    .line 925
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/html/FormattingAppendableImpl;->myWillIndent:Z

    return-object p0
.end method
