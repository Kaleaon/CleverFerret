.class public Lcom/radaee/pdf/PageContent;
.super Ljava/lang/Object;
.source "PageContent.java"


# instance fields
.field protected hand:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 41
    iput-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    return-void
.end method

.method private static native clipPath(JJZ)V
.end method

.method private static native create()J
.end method

.method private static native destroy(J)V
.end method

.method private static native drawForm(JJ)V
.end method

.method private static native drawImage(JJ)V
.end method

.method private static native drawText(JLjava/lang/String;)V
.end method

.method private static native drawText2(JLjava/lang/String;IF)I
.end method

.method private static native drawText3(JLjava/lang/String;IFI)I
.end method

.method private static native fillPath(JJZ)V
.end method

.method private static native gsRestore(J)V
.end method

.method private static native gsSave(J)V
.end method

.method private static native gsSet(JJ)V
.end method

.method private static native gsSetMatrix(JJ)V
.end method

.method private static native setFillColor(JI)V
.end method

.method private static native setStrokeCap(JI)V
.end method

.method private static native setStrokeColor(JI)V
.end method

.method private static native setStrokeJoin(JI)V
.end method

.method private static native setStrokeMiter(JF)V
.end method

.method private static native setStrokeWidth(JF)V
.end method

.method private static native strokePath(JJ)V
.end method

.method private static native textBegin(J)V
.end method

.method private static native textEnd(J)V
.end method

.method private static native textGetSize(JJLjava/lang/String;FFFF)[F
.end method

.method private static native textMove(JFF)V
.end method

.method private static native textNextLine(J)V
.end method

.method private static native textSetCharSpace(JF)V
.end method

.method private static native textSetFont(JJF)V
.end method

.method private static native textSetHScale(JI)V
.end method

.method private static native textSetLeading(JF)V
.end method

.method private static native textSetRenderMode(JI)V
.end method

.method private static native textSetRise(JF)V
.end method

.method private static native textSetWordSpace(JF)V
.end method


# virtual methods
.method public final ClipPath(Lcom/radaee/pdf/Path;Z)V
    .locals 4

    if-eqz p1, :cond_0

    .line 125
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v0, v1, v2, v3, p2}, Lcom/radaee/pdf/PageContent;->clipPath(JJZ)V

    :cond_0
    return-void
.end method

.method public final Create()V
    .locals 2

    .line 47
    invoke-static {}, Lcom/radaee/pdf/PageContent;->create()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    return-void
.end method

.method public final Destroy()V
    .locals 2

    .line 54
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/PageContent;->destroy(J)V

    const-wide/16 v0, 0x0

    .line 55
    iput-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    return-void
.end method

.method public final DrawForm(Lcom/radaee/pdf/ResForm;)V
    .locals 4

    if-eqz p1, :cond_0

    .line 105
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/ResForm;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/PageContent;->drawForm(JJ)V

    :cond_0
    return-void
.end method

.method public final DrawImage(Lcom/radaee/pdf/ResImage;)V
    .locals 4

    if-eqz p1, :cond_0

    .line 95
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/ResImage;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/PageContent;->drawImage(JJ)V

    :cond_0
    return-void
.end method

.method public final DrawText(Ljava/lang/String;IF)I
    .locals 2

    .line 201
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/radaee/pdf/PageContent;->drawText2(JLjava/lang/String;IF)I

    move-result p1

    return p1
.end method

.method public final DrawText(Ljava/lang/String;)V
    .locals 2

    .line 190
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/PageContent;->drawText(JLjava/lang/String;)V

    return-void
.end method

.method public final DrawText(Ljava/lang/String;IFI)[I
    .locals 6

    .line 214
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/PageContent;->drawText3(JLjava/lang/String;IFI)I

    move-result p1

    const p2, 0xfffff

    and-int/2addr p2, p1

    shr-int/lit8 p1, p1, 0x14

    .line 217
    filled-new-array {p2, p1}, [I

    move-result-object p1

    return-object p1
.end method

.method public final FillPath(Lcom/radaee/pdf/Path;Z)V
    .locals 4

    if-eqz p1, :cond_0

    .line 115
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v0, v1, v2, v3, p2}, Lcom/radaee/pdf/PageContent;->fillPath(JJZ)V

    :cond_0
    return-void
.end method

.method public final GSRestore()V
    .locals 2

    .line 69
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/PageContent;->gsRestore(J)V

    return-void
.end method

.method public final GSSave()V
    .locals 2

    .line 62
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/PageContent;->gsSave(J)V

    return-void
.end method

.method public final GSSet(Lcom/radaee/pdf/ResGState;)V
    .locals 4

    if-eqz p1, :cond_0

    .line 86
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/ResGState;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/PageContent;->gsSet(JJ)V

    :cond_0
    return-void
.end method

.method public final GSSetMatrix(Lcom/radaee/pdf/Matrix;)V
    .locals 4

    .line 77
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Matrix;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/PageContent;->gsSetMatrix(JJ)V

    return-void
.end method

.method public final SetFillColor(I)V
    .locals 2

    .line 142
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/PageContent;->setFillColor(JI)V

    return-void
.end method

.method public final SetStrokeCap(I)V
    .locals 2

    .line 158
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/PageContent;->setStrokeCap(JI)V

    return-void
.end method

.method public final SetStrokeColor(I)V
    .locals 2

    .line 150
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/PageContent;->setStrokeColor(JI)V

    return-void
.end method

.method public final SetStrokeJoin(I)V
    .locals 2

    .line 166
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/PageContent;->setStrokeJoin(JI)V

    return-void
.end method

.method public final SetStrokeMiter(F)V
    .locals 2

    .line 182
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/PageContent;->setStrokeMiter(JF)V

    return-void
.end method

.method public final SetStrokeWidth(F)V
    .locals 2

    .line 174
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/PageContent;->setStrokeWidth(JF)V

    return-void
.end method

.method public final StrokePath(Lcom/radaee/pdf/Path;)V
    .locals 4

    if-eqz p1, :cond_0

    .line 134
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/PageContent;->strokePath(JJ)V

    :cond_0
    return-void
.end method

.method public final TextBegin()V
    .locals 2

    .line 225
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/PageContent;->textBegin(J)V

    return-void
.end method

.method public final TextEnd()V
    .locals 2

    .line 232
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/PageContent;->textEnd(J)V

    return-void
.end method

.method public final TextGetSize(Lcom/radaee/pdf/ResFont;Ljava/lang/String;FFFF)[F
    .locals 9

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 329
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/ResFont;->hand:J

    move-object v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move v8, p6

    invoke-static/range {v0 .. v8}, Lcom/radaee/pdf/PageContent;->textGetSize(JJLjava/lang/String;FFFF)[F

    move-result-object p1

    return-object p1
.end method

.method public final TextMove(FF)V
    .locals 2

    .line 288
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/PageContent;->textMove(JFF)V

    return-void
.end method

.method public final TextNextLine()V
    .locals 2

    .line 279
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/PageContent;->textNextLine(J)V

    return-void
.end method

.method public final TextSetCharSpace(F)V
    .locals 2

    .line 240
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/PageContent;->textSetCharSpace(JF)V

    return-void
.end method

.method public final TextSetFont(Lcom/radaee/pdf/ResFont;F)V
    .locals 4

    if-eqz p1, :cond_0

    .line 314
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/ResFont;->hand:J

    invoke-static {v0, v1, v2, v3, p2}, Lcom/radaee/pdf/PageContent;->textSetFont(JJF)V

    :cond_0
    return-void
.end method

.method public final TextSetHScale(I)V
    .locals 2

    .line 272
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/PageContent;->textSetHScale(JI)V

    return-void
.end method

.method public final TextSetLeading(F)V
    .locals 2

    .line 256
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/PageContent;->textSetLeading(JF)V

    return-void
.end method

.method public final TextSetRenderMode(I)V
    .locals 2

    .line 304
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/PageContent;->textSetRenderMode(JI)V

    return-void
.end method

.method public final TextSetRise(F)V
    .locals 2

    .line 264
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/PageContent;->textSetRise(JF)V

    return-void
.end method

.method public final TextSetWordSpace(F)V
    .locals 2

    .line 248
    iget-wide v0, p0, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/PageContent;->textSetWordSpace(JF)V

    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 334
    invoke-virtual {p0}, Lcom/radaee/pdf/PageContent;->Destroy()V

    .line 335
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
