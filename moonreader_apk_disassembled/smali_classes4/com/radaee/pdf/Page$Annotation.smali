.class public Lcom/radaee/pdf/Page$Annotation;
.super Ljava/lang/Object;
.source "Page.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/pdf/Page;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Annotation"
.end annotation


# instance fields
.field protected hand:J

.field public page:Lcom/radaee/pdf/Page;


# direct methods
.method protected constructor <init>(Lcom/radaee/pdf/Page;J)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    .line 26
    iput-wide p2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    return-void
.end method


# virtual methods
.method public final Advance_GetRef()Lcom/radaee/pdf/adv/Ref;
    .locals 8

    .line 35
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-wide v2, v0, Lcom/radaee/pdf/Page;->hand:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_2

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    goto :goto_0

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v2, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v6, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v2, v3, v6, v7}, Lcom/radaee/pdf/Page;->access$000(JJ)J

    move-result-wide v2

    cmp-long v0, v2, v4

    if-nez v0, :cond_1

    return-object v1

    .line 38
    :cond_1
    new-instance v0, Lcom/radaee/pdf/adv/Ref;

    invoke-direct {v0, v2, v3}, Lcom/radaee/pdf/adv/Ref;-><init>(J)V

    return-object v0

    :cond_2
    :goto_0
    return-object v1
.end method

.method public final Advance_Reload()V
    .locals 5

    .line 47
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_1

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    iget-wide v0, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    goto :goto_0

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$100(JJ)V

    :cond_1
    :goto_0
    return-void
.end method

.method public final Export()[B
    .locals 4

    .line 1440
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$12200(JJ)[B

    move-result-object v0

    return-object v0
.end method

.method public final Get3D()Ljava/lang/String;
    .locals 4

    .line 504
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$4100(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final Get3DData(Ljava/lang/String;)Z
    .locals 4

    .line 545
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$4600(JJLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final GetAdditionalJS(I)Ljava/lang/String;
    .locals 4

    .line 486
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$3900(JJI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final GetAttachment()Ljava/lang/String;
    .locals 4

    .line 531
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$4400(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetAttachmentData(Ljava/lang/String;)Z
    .locals 4

    .line 576
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$4900(JJLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final GetCheckStatus()I
    .locals 4

    .line 1032
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$9000(JJ)I

    move-result v0

    return v0
.end method

.method public final GetComboItem(I)Ljava/lang/String;
    .locals 4

    .line 873
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$7400(JJI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final GetComboItemCount()I
    .locals 4

    .line 863
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$7300(JJ)I

    move-result v0

    return v0
.end method

.method public final GetComboItemSel()I
    .locals 4

    .line 893
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$7600(JJ)I

    move-result v0

    return v0
.end method

.method public final GetComboItemVal(I)Ljava/lang/String;
    .locals 4

    .line 884
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$7500(JJI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final GetDest()I
    .locals 4

    .line 419
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$3300(JJ)I

    move-result v0

    return v0
.end method

.method public final GetEditMaxlen()I
    .locals 4

    .line 702
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$6000(JJ)I

    move-result v0

    return v0
.end method

.method public final GetEditText()Ljava/lang/String;
    .locals 4

    .line 815
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$6900(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetEditTextAlign()I
    .locals 4

    .line 744
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$6400(JJ)I

    move-result v0

    return v0
.end method

.method public final GetEditTextColor()I
    .locals 4

    .line 796
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$6700(JJ)I

    move-result v0

    return v0
.end method

.method public final GetEditTextRect([F)Z
    .locals 4

    .line 714
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$6100(JJ[F)Z

    move-result p1

    return p1
.end method

.method public final GetEditTextSize()F
    .locals 4

    .line 723
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$6200(JJ)F

    move-result v0

    return v0
.end method

.method public final GetEditType()I
    .locals 4

    .line 693
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$5900(JJ)I

    move-result v0

    return v0
.end method

.method public final GetFieldFlag()I
    .locals 4

    .line 123
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$800(JJ)I

    move-result v0

    return v0
.end method

.method public final GetFieldFormat()Ljava/lang/String;
    .locals 5

    .line 787
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    const/4 v4, 0x1

    invoke-static {v0, v1, v2, v3, v4}, Lcom/radaee/pdf/Page;->access$6600(JJI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetFieldFullName()Ljava/lang/String;
    .locals 4

    .line 151
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$1100(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetFieldFullName2()Ljava/lang/String;
    .locals 4

    .line 160
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$1200(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetFieldJS(I)Ljava/lang/String;
    .locals 4

    .line 770
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$6600(JJI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final GetFieldName()Ljava/lang/String;
    .locals 4

    .line 132
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$900(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetFieldNameWithNO()Ljava/lang/String;
    .locals 4

    .line 142
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$1000(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetFieldType()I
    .locals 4

    .line 111
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$700(JJ)I

    move-result v0

    return v0
.end method

.method public final GetFileLink()Ljava/lang/String;
    .locals 4

    .line 495
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$4000(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetFillColor()I
    .locals 4

    .line 1120
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$9900(JJ)I

    move-result v0

    return v0
.end method

.method public final GetIcon()I
    .locals 4

    .line 1406
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$11900(JJ)I

    move-result v0

    return v0
.end method

.method public GetIndexInPage()I
    .locals 8

    .line 60
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    const/4 v1, -0x1

    if-eqz v0, :cond_2

    iget-wide v2, v0, Lcom/radaee/pdf/Page;->hand:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_2

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    goto :goto_1

    .line 62
    :cond_0
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v2, v0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v2, v3}, Lcom/radaee/pdf/Page;->access$300(J)I

    move-result v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    .line 65
    iget-object v3, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v3, v3, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v3, v4, v2}, Lcom/radaee/pdf/Page;->access$400(JI)J

    move-result-wide v3

    .line 66
    iget-wide v5, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    cmp-long v7, v5, v3

    if-nez v7, :cond_1

    return v2

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return v1
.end method

.method public final GetInkPath()Lcom/radaee/pdf/Path;
    .locals 5

    .line 1198
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$10700(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 1200
    :cond_0
    new-instance v2, Lcom/radaee/pdf/Path;

    invoke-direct {v2, v0, v1}, Lcom/radaee/pdf/Path;-><init>(J)V

    return-object v2
.end method

.method public final GetJS()Ljava/lang/String;
    .locals 4

    .line 466
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$3800(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetLinePoint(I)[F
    .locals 4

    .line 1269
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$11300(JJI)[F

    move-result-object p1

    return-object p1
.end method

.method public final GetLineStyle()I
    .locals 4

    .line 1283
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$11500(JJ)I

    move-result v0

    return v0
.end method

.method public final GetListItem(I)Ljava/lang/String;
    .locals 4

    .line 931
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$8000(JJI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final GetListItemCount()I
    .locals 4

    .line 921
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$7900(JJ)I

    move-result v0

    return v0
.end method

.method public final GetListItemVal(I)Ljava/lang/String;
    .locals 4

    .line 941
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$8100(JJI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final GetListSels()[I
    .locals 4

    .line 1012
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$8800(JJ)[I

    move-result-object v0

    return-object v0
.end method

.method public final GetMarkupRects()[F
    .locals 4

    .line 301
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$2200(JJ)[F

    move-result-object v0

    return-object v0
.end method

.method public final GetModifyDate()Ljava/lang/String;
    .locals 4

    .line 224
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$1400(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetMovie()Ljava/lang/String;
    .locals 4

    .line 513
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$4200(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetMovieData(Ljava/lang/String;)Z
    .locals 4

    .line 555
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$4700(JJLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final GetName()Ljava/lang/String;
    .locals 4

    .line 438
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$3500(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetPolygonPath()Lcom/radaee/pdf/Path;
    .locals 5

    .line 1221
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$10900(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 1223
    :cond_0
    new-instance v2, Lcom/radaee/pdf/Path;

    invoke-direct {v2, v0, v1}, Lcom/radaee/pdf/Path;-><init>(J)V

    return-object v2
.end method

.method public final GetPolylinePath()Lcom/radaee/pdf/Path;
    .locals 5

    .line 1244
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$11100(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 1246
    :cond_0
    new-instance v2, Lcom/radaee/pdf/Path;

    invoke-direct {v2, v0, v1}, Lcom/radaee/pdf/Path;-><init>(J)V

    return-object v2
.end method

.method public final GetPopup()Lcom/radaee/pdf/Page$Annotation;
    .locals 5

    .line 320
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$2400(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 323
    new-instance v2, Lcom/radaee/pdf/Page$Annotation;

    iget-object v3, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    invoke-direct {v2, v3, v0, v1}, Lcom/radaee/pdf/Page$Annotation;-><init>(Lcom/radaee/pdf/Page;J)V

    return-object v2

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public final GetPopupLabel()Ljava/lang/String;
    .locals 4

    .line 378
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$2900(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetPopupOpen()Z
    .locals 4

    .line 337
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$2500(JJ)Z

    move-result v0

    return v0
.end method

.method public final GetPopupSubject()Ljava/lang/String;
    .locals 4

    .line 399
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$3100(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetPopupText()Ljava/lang/String;
    .locals 4

    .line 357
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$2700(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetRect()[F
    .locals 5

    const/4 v0, 0x4

    .line 274
    new-array v0, v0, [F

    .line 275
    iget-object v1, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v1, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v1, v2, v3, v4, v0}, Lcom/radaee/pdf/Page;->access$2000(JJ[F)V

    return-object v0
.end method

.method public final GetRef()J
    .locals 4

    .line 52
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$200(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public final GetRemoteDest()Ljava/lang/String;
    .locals 4

    .line 429
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$3400(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetRendition()Ljava/lang/String;
    .locals 4

    .line 535
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$4500(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetRenditionData(Ljava/lang/String;)Z
    .locals 4

    .line 580
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$5000(JJLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final GetReset()Z
    .locals 4

    .line 1081
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$9500(JJ)Z

    move-result v0

    return v0
.end method

.method public final GetRichMediaData(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7

    .line 684
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    move-object v5, p1

    move-object v6, p2

    invoke-static/range {v1 .. v6}, Lcom/radaee/pdf/Page;->access$5800(JJLjava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final GetRichMediaItemActived()I
    .locals 4

    .line 600
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$5200(JJ)I

    move-result v0

    return v0
.end method

.method public final GetRichMediaItemAsset(I)Ljava/lang/String;
    .locals 4

    .line 628
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$5400(JJI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final GetRichMediaItemCount()I
    .locals 4

    .line 590
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$5100(JJ)I

    move-result v0

    return v0
.end method

.method public final GetRichMediaItemPara(I)Ljava/lang/String;
    .locals 4

    .line 640
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$5500(JJI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final GetRichMediaItemSource(I)Ljava/lang/String;
    .locals 4

    .line 653
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$5600(JJI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final GetRichMediaItemSourceData(ILjava/lang/String;)Z
    .locals 7

    .line 665
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    move v5, p1

    move-object v6, p2

    invoke-static/range {v1 .. v6}, Lcom/radaee/pdf/Page;->access$5700(JJILjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final GetRichMediaItemType(I)I
    .locals 4

    .line 616
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$5300(JJI)I

    move-result p1

    return p1
.end method

.method public final GetSign()Lcom/radaee/pdf/Sign;
    .locals 5

    .line 1068
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$9400(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 1070
    :cond_0
    new-instance v2, Lcom/radaee/pdf/Sign;

    invoke-direct {v2}, Lcom/radaee/pdf/Sign;-><init>()V

    .line 1071
    iput-wide v0, v2, Lcom/radaee/pdf/Sign;->m_hand:J

    return-object v2
.end method

.method public final GetSignStatus()I
    .locals 4

    .line 1064
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$9300(JJ)I

    move-result v0

    return v0
.end method

.method public final GetSound()Ljava/lang/String;
    .locals 4

    .line 522
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$4300(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetSoundData([ILjava/lang/String;)Z
    .locals 7

    .line 566
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    move-object v5, p1

    move-object v6, p2

    invoke-static/range {v1 .. v6}, Lcom/radaee/pdf/Page;->access$4800(JJ[ILjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final GetStrokeColor()I
    .locals 4

    .line 1140
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$10100(JJ)I

    move-result v0

    return v0
.end method

.method public final GetStrokeDash()[F
    .locals 4

    .line 1189
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$10600(JJ)[F

    move-result-object v0

    return-object v0
.end method

.method public final GetStrokeWidth()F
    .locals 4

    .line 1161
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$10300(JJ)F

    move-result v0

    return v0
.end method

.method public final GetSubmitPara()Ljava/lang/String;
    .locals 4

    .line 1111
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$9800(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetSubmitTarget()Ljava/lang/String;
    .locals 4

    .line 1100
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$9700(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final GetType()I
    .locals 4

    .line 196
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$1300(JJ)I

    move-result v0

    return v0
.end method

.method public final GetURI()Ljava/lang/String;
    .locals 4

    .line 457
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$3700(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final InsertComboItem(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 8

    .line 985
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    move v5, p1

    move-object v6, p2

    move-object v7, p3

    invoke-static/range {v1 .. v7}, Lcom/radaee/pdf/Page;->access$8500(JJILjava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final InsertListItem(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 8

    .line 963
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    move v5, p1

    move-object v6, p2

    move-object v7, p3

    invoke-static/range {v1 .. v7}, Lcom/radaee/pdf/Page;->access$8300(JJILjava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final IsHide()Z
    .locals 4

    .line 265
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$1900(JJ)Z

    move-result v0

    return v0
.end method

.method public final IsListMultiSel()Z
    .locals 4

    .line 912
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$7800(JJ)Z

    move-result v0

    return v0
.end method

.method public final IsLocked()Z
    .locals 4

    .line 240
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$1600(JJ)Z

    move-result v0

    return v0
.end method

.method public final IsLockedContent()Z
    .locals 4

    .line 257
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$1800(JJ)Z

    move-result v0

    return v0
.end method

.method public final IsReadOnly()Z
    .locals 4

    .line 994
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$8600(JJ)Z

    move-result v0

    return v0
.end method

.method public final MoveToPage(Lcom/radaee/pdf/Page;[F)Z
    .locals 8

    .line 82
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p1, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v5, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    move-object v7, p2

    invoke-static/range {v1 .. v7}, Lcom/radaee/pdf/Page;->access$500(JJJ[F)Z

    move-result p2

    .line 83
    iput-object p1, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    return p2
.end method

.method public final RemoveComboItem(I)Z
    .locals 4

    .line 973
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$8400(JJI)Z

    move-result p1

    return p1
.end method

.method public final RemoveFromPage()Z
    .locals 4

    .line 1416
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$12000(JJ)Z

    move-result v0

    const-wide/16 v1, 0x0

    .line 1417
    iput-wide v1, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    return v0
.end method

.method public final RemoveListItem(I)Z
    .locals 4

    .line 951
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$8200(JJI)Z

    move-result p1

    return p1
.end method

.method public final RenderToBmp(Landroid/graphics/Bitmap;)Z
    .locals 4

    .line 97
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$600(JJLandroid/graphics/Bitmap;)Z

    move-result p1

    return p1
.end method

.method public final SetCheckValue(Z)Z
    .locals 4

    .line 1043
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$9100(JJZ)Z

    move-result p1

    return p1
.end method

.method public final SetComboItem(I)Z
    .locals 4

    .line 904
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$7700(JJI)Z

    move-result p1

    return p1
.end method

.method public final SetEditFont(Lcom/radaee/pdf/Document$DocFont;)Z
    .locals 7

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 853
    :cond_0
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    iget-wide v5, p1, Lcom/radaee/pdf/Document$DocFont;->hand:J

    invoke-static/range {v1 .. v6}, Lcom/radaee/pdf/Page;->access$7200(JJJ)Z

    move-result p1

    return p1
.end method

.method public final SetEditText(Ljava/lang/String;)Z
    .locals 4

    .line 827
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$7000(JJLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final SetEditText(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7

    .line 840
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    move-object v5, p1

    move-object v6, p2

    invoke-static/range {v1 .. v6}, Lcom/radaee/pdf/Page;->access$7100(JJLjava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final SetEditTextAlign(I)Z
    .locals 4

    .line 755
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$6500(JJI)Z

    move-result p1

    return p1
.end method

.method public final SetEditTextColor(I)Z
    .locals 4

    .line 806
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$6800(JJI)Z

    move-result p1

    return p1
.end method

.method public final SetEditTextSize(F)Z
    .locals 4

    .line 734
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$6300(JJF)Z

    move-result p1

    return p1
.end method

.method public final SetFillColor(I)Z
    .locals 4

    .line 1131
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$10000(JJI)Z

    move-result p1

    return p1
.end method

.method public final SetHide(Z)V
    .locals 4

    .line 311
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$2300(JJZ)V

    return-void
.end method

.method public final SetIcon(I)Z
    .locals 4

    .line 1346
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$11700(JJI)Z

    move-result p1

    return p1
.end method

.method public final SetIcon(Ljava/lang/String;Lcom/radaee/pdf/Document$DocForm;)Z
    .locals 8

    .line 1356
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    iget-wide v6, p2, Lcom/radaee/pdf/Document$DocForm;->hand:J

    move-object v5, p1

    invoke-static/range {v1 .. v7}, Lcom/radaee/pdf/Page;->access$11800(JJLjava/lang/String;J)Z

    move-result p1

    return p1
.end method

.method public final SetInkPath(Lcom/radaee/pdf/Path;)Z
    .locals 7

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 1212
    :cond_0
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    iget-wide v5, p1, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static/range {v1 .. v6}, Lcom/radaee/pdf/Page;->access$10800(JJJ)Z

    move-result p1

    return p1
.end method

.method public final SetLinePoint(FFFF)Z
    .locals 9

    .line 1273
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    move v5, p1

    move v6, p2

    move v7, p3

    move v8, p4

    invoke-static/range {v1 .. v8}, Lcom/radaee/pdf/Page;->access$11400(JJFFFF)Z

    move-result p1

    return p1
.end method

.method public final SetLineStyle(I)Z
    .locals 4

    .line 1294
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$11600(JJI)Z

    move-result p1

    return p1
.end method

.method public final SetListSels([I)Z
    .locals 4

    .line 1022
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$8900(JJ[I)Z

    move-result p1

    return p1
.end method

.method public final SetLocked(Z)V
    .locals 4

    .line 248
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$1700(JJZ)V

    return-void
.end method

.method public final SetModifyDate(Ljava/lang/String;)Z
    .locals 4

    .line 232
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$1500(JJLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final SetName(Ljava/lang/String;)Z
    .locals 4

    .line 448
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$3600(JJLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final SetPolygonPath(Lcom/radaee/pdf/Path;)Z
    .locals 7

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 1235
    :cond_0
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    iget-wide v5, p1, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static/range {v1 .. v6}, Lcom/radaee/pdf/Page;->access$11000(JJJ)Z

    move-result p1

    return p1
.end method

.method public final SetPolylinePath(Lcom/radaee/pdf/Path;)Z
    .locals 7

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 1258
    :cond_0
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    iget-wide v5, p1, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static/range {v1 .. v6}, Lcom/radaee/pdf/Page;->access$11200(JJJ)Z

    move-result p1

    return p1
.end method

.method public final SetPopupLabel(Ljava/lang/String;)Z
    .locals 4

    .line 368
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$2800(JJLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final SetPopupOpen(Z)Z
    .locals 4

    .line 347
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$2600(JJZ)Z

    move-result p1

    return p1
.end method

.method public final SetPopupSubject(Ljava/lang/String;)Z
    .locals 4

    .line 410
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$3200(JJLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public SetPopupText(Ljava/lang/String;)Z
    .locals 4

    .line 389
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$3000(JJLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final SetRadio()Z
    .locals 4

    .line 1053
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$9200(JJ)Z

    move-result v0

    return v0
.end method

.method public final SetReadOnly(Z)V
    .locals 4

    .line 1003
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$8700(JJZ)V

    return-void
.end method

.method public final SetRect(FFFF)V
    .locals 2

    const/4 v0, 0x4

    .line 289
    new-array v0, v0, [F

    const/4 v1, 0x0

    aput p1, v0, v1

    const/4 p1, 0x1

    aput p2, v0, p1

    const/4 p1, 0x2

    aput p3, v0, p1

    const/4 p1, 0x3

    aput p4, v0, p1

    .line 290
    iget-object p1, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide p1, p1, Lcom/radaee/pdf/Page;->hand:J

    iget-wide p3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {p1, p2, p3, p4, v0}, Lcom/radaee/pdf/Page;->access$2100(JJ[F)V

    return-void
.end method

.method public final SetReset()Z
    .locals 4

    .line 1091
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$9600(JJ)Z

    move-result v0

    return v0
.end method

.method public final SetStrokeColor(I)Z
    .locals 4

    .line 1151
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$10200(JJI)Z

    move-result p1

    return p1
.end method

.method public final SetStrokeDash([F)Z
    .locals 4

    .line 1185
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$10500(JJ[F)Z

    move-result p1

    return p1
.end method

.method public final SetStrokeWidth(F)Z
    .locals 4

    .line 1173
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Page;->access$10400(JJF)Z

    move-result p1

    return p1
.end method

.method public final SignField(Lcom/radaee/pdf/Document$DocForm;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 13

    .line 1461
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v1, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    iget-wide v5, p1, Lcom/radaee/pdf/Document$DocForm;->hand:J

    move-object v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    move-object/from16 v10, p5

    move-object/from16 v11, p6

    move-object/from16 v12, p7

    invoke-static/range {v1 .. v12}, Lcom/radaee/pdf/Page;->access$12300(JJJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public final flateFromPage()Z
    .locals 4

    .line 1429
    iget-object v0, p0, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget-wide v0, v0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->access$12100(JJ)Z

    move-result v0

    const-wide/16 v1, 0x0

    .line 1430
    iput-wide v1, p0, Lcom/radaee/pdf/Page$Annotation;->hand:J

    return v0
.end method

.method public isAnnotListType()Z
    .locals 3

    .line 200
    invoke-virtual {p0}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x3

    if-lt v0, v2, :cond_0

    const/16 v2, 0x10

    if-gt v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    return v1
.end method

.method public isHighlight()Z
    .locals 2

    .line 204
    invoke-virtual {p0}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result v0

    const/16 v1, 0x9

    if-lt v0, v1, :cond_0

    const/16 v1, 0xc

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
