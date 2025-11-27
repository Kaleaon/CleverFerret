.class public Lcom/radaee/pdf/Page;
.super Ljava/lang/Object;
.source "Page.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/pdf/Page$Finder;,
        Lcom/radaee/pdf/Page$Annotation;
    }
.end annotation


# static fields
.field public static note_end:I

.field public static note_start:I


# instance fields
.field protected hand:J

.field protected m_doc:Lcom/radaee/pdf/Document;

.field public pageno:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 1503
    iput-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    return-void
.end method

.method static synthetic access$000(JJ)J
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->advGetAnnotRef(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$100(JJ)V
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->advReloadAnnot(JJ)V

    return-void
.end method

.method static synthetic access$1000(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotFieldName(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$10000(JJI)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotFillColor(JJI)Z

    move-result p0

    return p0
.end method

.method static synthetic access$10100(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotStrokeColor(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$10200(JJI)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotStrokeColor(JJI)Z

    move-result p0

    return p0
.end method

.method static synthetic access$10300(JJ)F
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotStrokeWidth(JJ)F

    move-result p0

    return p0
.end method

.method static synthetic access$10400(JJF)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotStrokeWidth(JJF)Z

    move-result p0

    return p0
.end method

.method static synthetic access$10500(JJ[F)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotStrokeDash(JJ[F)Z

    move-result p0

    return p0
.end method

.method static synthetic access$10600(JJ)[F
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotStrokeDash(JJ)[F

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$10700(JJ)J
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotInkPath(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$10800(JJJ)Z
    .locals 0

    .line 17
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Page;->setAnnotInkPath(JJJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$10900(JJ)J
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotPolygonPath(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$1100(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotFieldFullName(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$11000(JJJ)Z
    .locals 0

    .line 17
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Page;->setAnnotPolygonPath(JJJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$11100(JJ)J
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotPolylinePath(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$11200(JJJ)Z
    .locals 0

    .line 17
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Page;->setAnnotPolylinePath(JJJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$11300(JJI)[F
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotLinePoint(JJI)[F

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$11400(JJFFFF)Z
    .locals 0

    .line 17
    invoke-static/range {p0 .. p7}, Lcom/radaee/pdf/Page;->setAnnotLinePoint(JJFFFF)Z

    move-result p0

    return p0
.end method

.method static synthetic access$11500(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotLineStyle(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$11600(JJI)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotLineStyle(JJI)Z

    move-result p0

    return p0
.end method

.method static synthetic access$11700(JJI)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotIcon(JJI)Z

    move-result p0

    return p0
.end method

.method static synthetic access$11800(JJLjava/lang/String;J)Z
    .locals 0

    .line 17
    invoke-static/range {p0 .. p6}, Lcom/radaee/pdf/Page;->setAnnotIcon2(JJLjava/lang/String;J)Z

    move-result p0

    return p0
.end method

.method static synthetic access$11900(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotIcon(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$1200(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotFieldFullName2(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$12000(JJ)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->removeAnnot(JJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$12100(JJ)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->flateAnnot(JJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$12200(JJ)[B
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->exportAnnot(JJ)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$12300(JJJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 17
    invoke-static/range {p0 .. p11}, Lcom/radaee/pdf/Page;->signAnnotField(JJJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static synthetic access$12400(J)I
    .locals 0

    .line 17
    invoke-static {p0, p1}, Lcom/radaee/pdf/Page;->findGetCount(J)I

    move-result p0

    return p0
.end method

.method static synthetic access$12500(JI)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2}, Lcom/radaee/pdf/Page;->findGetFirstChar(JI)I

    move-result p0

    return p0
.end method

.method static synthetic access$12600(JI)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2}, Lcom/radaee/pdf/Page;->findGetEndChar(JI)I

    move-result p0

    return p0
.end method

.method static synthetic access$12700(J)V
    .locals 0

    .line 17
    invoke-static {p0, p1}, Lcom/radaee/pdf/Page;->findClose(J)V

    return-void
.end method

.method static synthetic access$1300(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotType(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$1400(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotModifyDate(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1500(JJLjava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotModifyDate(JJLjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1600(JJ)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->isAnnotLocked(JJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1700(JJZ)V
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotLock(JJZ)V

    return-void
.end method

.method static synthetic access$1800(JJ)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->isAnnotLockedContent(JJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1900(JJ)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->isAnnotHide(JJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(JJ)J
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotRef(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$2000(JJ[F)V
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotRect(JJ[F)V

    return-void
.end method

.method static synthetic access$2100(JJ[F)V
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotRect(JJ[F)V

    return-void
.end method

.method static synthetic access$2200(JJ)[F
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotMarkupRects(JJ)[F

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2300(JJZ)V
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotHide(JJZ)V

    return-void
.end method

.method static synthetic access$2400(JJ)J
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotPopup(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$2500(JJ)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotPopupOpen(JJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$2600(JJZ)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotPopupOpen(JJZ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$2700(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotPopupText(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2800(JJLjava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotPopupLabel(JJLjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$2900(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotPopupLabel(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(J)I
    .locals 0

    .line 17
    invoke-static {p0, p1}, Lcom/radaee/pdf/Page;->getAnnotCount(J)I

    move-result p0

    return p0
.end method

.method static synthetic access$3000(JJLjava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotPopupText(JJLjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$3100(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotPopupSubject(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3200(JJLjava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotPopupSubject(JJLjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$3300(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotDest(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$3400(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotRemoteDest(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3500(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotName(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3600(JJLjava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotName(JJLjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$3700(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotURI(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3800(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotJS(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3900(JJI)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotAdditionalJS(JJI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(JI)J
    .locals 0

    .line 17
    invoke-static {p0, p1, p2}, Lcom/radaee/pdf/Page;->getAnnot(JI)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$4000(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotFileLink(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4100(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnot3D(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4200(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotMovie(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4300(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotSound(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4400(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotAttachment(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4500(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotRendition(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4600(JJLjava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnot3DData(JJLjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$4700(JJLjava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotMovieData(JJLjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$4800(JJ[ILjava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Page;->getAnnotSoundData(JJ[ILjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$4900(JJLjava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotAttachmentData(JJLjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$500(JJJ[F)Z
    .locals 0

    .line 17
    invoke-static/range {p0 .. p6}, Lcom/radaee/pdf/Page;->moveAnnot(JJJ[F)Z

    move-result p0

    return p0
.end method

.method static synthetic access$5000(JJLjava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotRenditionData(JJLjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$5100(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotRichMediaItemCount(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$5200(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotRichMediaItemActived(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$5300(JJI)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotRichMediaItemType(JJI)I

    move-result p0

    return p0
.end method

.method static synthetic access$5400(JJI)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotRichMediaItemAsset(JJI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$5500(JJI)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotRichMediaItemPara(JJI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$5600(JJI)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotRichMediaItemSource(JJI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$5700(JJILjava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Page;->getAnnotRichMediaItemSourceData(JJILjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$5800(JJLjava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Page;->getAnnotRichMediaData(JJLjava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$5900(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotEditType(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$600(JJLandroid/graphics/Bitmap;)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->renderAnnotToBmp(JJLandroid/graphics/Bitmap;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$6000(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotEditMaxlen(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$6100(JJ[F)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotEditTextRect(JJ[F)Z

    move-result p0

    return p0
.end method

.method static synthetic access$6200(JJ)F
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotEditTextSize(JJ)F

    move-result p0

    return p0
.end method

.method static synthetic access$6300(JJF)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotEditTextSize(JJF)Z

    move-result p0

    return p0
.end method

.method static synthetic access$6400(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotEditTextAlign(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$6500(JJI)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotEditTextAlign(JJI)Z

    move-result p0

    return p0
.end method

.method static synthetic access$6600(JJI)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotFieldJS(JJI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$6700(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotEditTextColor(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$6800(JJI)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotEditTextColor(JJI)Z

    move-result p0

    return p0
.end method

.method static synthetic access$6900(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotEditText(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotFieldType(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$7000(JJLjava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotEditText(JJLjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$7100(JJLjava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Page;->setAnnotEditText2(JJLjava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$7200(JJJ)Z
    .locals 0

    .line 17
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Page;->setAnnotEditFont(JJJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$7300(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotComboItemCount(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$7400(JJI)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotComboItem(JJI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$7500(JJI)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotComboItemVal(JJI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$7600(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotComboItemSel(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$7700(JJI)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotComboItem(JJI)Z

    move-result p0

    return p0
.end method

.method static synthetic access$7800(JJ)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->isAnnotListMultiSel(JJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$7900(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotListItemCount(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$800(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotFieldFlag(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$8000(JJI)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotListItem(JJI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$8100(JJI)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->getAnnotListItemVal(JJI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$8200(JJI)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->removeAnnotListItem(JJI)Z

    move-result p0

    return p0
.end method

.method static synthetic access$8300(JJILjava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static/range {p0 .. p6}, Lcom/radaee/pdf/Page;->insertAnnotListItem(JJILjava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$8400(JJI)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->removeAnnotComboItem(JJI)Z

    move-result p0

    return p0
.end method

.method static synthetic access$8500(JJILjava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 17
    invoke-static/range {p0 .. p6}, Lcom/radaee/pdf/Page;->insertAnnotComboItem(JJILjava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$8600(JJ)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->isAnnotReadOnly(JJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$8700(JJZ)V
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotReadOnly(JJZ)V

    return-void
.end method

.method static synthetic access$8800(JJ)[I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotListSels(JJ)[I

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$8900(JJ[I)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotListSels(JJ[I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$900(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotFieldNameWithoutNO(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$9000(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotCheckStatus(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$9100(JJZ)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Page;->setAnnotCheckValue(JJZ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$9200(JJ)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->setAnnotRadio(JJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$9300(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotSignStatus(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$9400(JJ)J
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotSign(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$9500(JJ)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotReset(JJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$9600(JJ)Z
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->setAnnotReset(JJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$9700(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotSubmitTarget(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$9800(JJ)Ljava/lang/String;
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotSubmitPara(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$9900(JJ)I
    .locals 0

    .line 17
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Page;->getAnnotFillColor(JJ)I

    move-result p0

    return p0
.end method

.method private static native addAnnot(JJ)Z
.end method

.method private static native addAnnot2(JJI)Z
.end method

.method private static native addAnnotAttachment(JLjava/lang/String;I[F)Z
.end method

.method private static native addAnnotBitmap(JJ[F)Z
.end method

.method private static native addAnnotEditbox(JJ[FIFIFI)Z
.end method

.method private static native addAnnotEditbox2(J[FIFIFI)Z
.end method

.method private static native addAnnotEllipse(JJ[FFII)Z
.end method

.method private static native addAnnotEllipse2(J[FFII)Z
.end method

.method private static native addAnnotGlyph(JJJIZ)Z
.end method

.method private static native addAnnotGoto(J[FIF)Z
.end method

.method private static native addAnnotHWriting(JJJFF)Z
.end method

.method private static native addAnnotInk(JJJFF)Z
.end method

.method private static native addAnnotInk2(JJ)Z
.end method

.method private static native addAnnotLine(JJ[F[FIIFII)Z
.end method

.method private static native addAnnotLine2(J[F[FIIFII)Z
.end method

.method private static native addAnnotMarkup(JJ[FII)Z
.end method

.method private static native addAnnotMarkup2(JIIII)Z
.end method

.method private static native addAnnotPolygon(JJIIF)Z
.end method

.method private static native addAnnotPolyline(JJIIIIF)Z
.end method

.method private static native addAnnotPopup(JJ[FZ)Z
.end method

.method private static native addAnnotRect(JJ[FFII)Z
.end method

.method private static native addAnnotRect2(J[FFII)Z
.end method

.method private static native addAnnotRichMedia(JLjava/lang/String;Ljava/lang/String;IJ[F)Z
.end method

.method private static native addAnnotStamp(J[FI)Z
.end method

.method private static native addAnnotText(J[F)Z
.end method

.method private static native addAnnotURI(J[FLjava/lang/String;)Z
.end method

.method private static native addContent(JJZ)Z
.end method

.method private static native addResFont(JJ)J
.end method

.method private static native addResForm(JJ)J
.end method

.method private static native addResGState(JJ)J
.end method

.method private static native addResImage(JJ)J
.end method

.method private static native advGetAnnotRef(JJ)J
.end method

.method private static native advGetRef(J)J
.end method

.method private static native advReload(J)V
.end method

.method private static native advReloadAnnot(JJ)V
.end method

.method private static native close(J)V
.end method

.method private static native copyAnnot(JJ[F)Z
.end method

.method private static native exportAnnot(JJ)[B
.end method

.method private static native findClose(J)V
.end method

.method private static native findGetCount(J)I
.end method

.method private static native findGetEndChar(JI)I
.end method

.method private static native findGetFirstChar(JI)I
.end method

.method private static native findOpen(JLjava/lang/String;ZZ)J
.end method

.method private static native findOpen2(JLjava/lang/String;ZZZ)J
.end method

.method private static native flate(J)Z
.end method

.method private static native flateAnnot(JJ)Z
.end method

.method private static native getAnnot(JI)J
.end method

.method private static native getAnnot3D(JJ)Ljava/lang/String;
.end method

.method private static native getAnnot3DData(JJLjava/lang/String;)Z
.end method

.method private static native getAnnotAdditionalJS(JJI)Ljava/lang/String;
.end method

.method private static native getAnnotAttachment(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotAttachmentData(JJLjava/lang/String;)Z
.end method

.method private static native getAnnotByName(JLjava/lang/String;)J
.end method

.method private static native getAnnotCheckStatus(JJ)I
.end method

.method private static native getAnnotComboItem(JJI)Ljava/lang/String;
.end method

.method private static native getAnnotComboItemCount(JJ)I
.end method

.method private static native getAnnotComboItemSel(JJ)I
.end method

.method private static native getAnnotComboItemVal(JJI)Ljava/lang/String;
.end method

.method private static native getAnnotCount(J)I
.end method

.method private static native getAnnotDest(JJ)I
.end method

.method private static native getAnnotEditMaxlen(JJ)I
.end method

.method private static native getAnnotEditText(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotEditTextAlign(JJ)I
.end method

.method private static native getAnnotEditTextColor(JJ)I
.end method

.method private static native getAnnotEditTextRect(JJ[F)Z
.end method

.method private static native getAnnotEditTextSize(JJ)F
.end method

.method private static native getAnnotEditType(JJ)I
.end method

.method private static native getAnnotFieldFlag(JJ)I
.end method

.method private static native getAnnotFieldFullName(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotFieldFullName2(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotFieldJS(JJI)Ljava/lang/String;
.end method

.method private static native getAnnotFieldName(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotFieldNameWithoutNO(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotFieldType(JJ)I
.end method

.method private static native getAnnotFileLink(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotFillColor(JJ)I
.end method

.method private static native getAnnotFromPoint(JFF)J
.end method

.method private static native getAnnotIcon(JJ)I
.end method

.method private static native getAnnotInkPath(JJ)J
.end method

.method private static native getAnnotJS(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotLinePoint(JJI)[F
.end method

.method private static native getAnnotLineStyle(JJ)I
.end method

.method private static native getAnnotListItem(JJI)Ljava/lang/String;
.end method

.method private static native getAnnotListItemCount(JJ)I
.end method

.method private static native getAnnotListItemVal(JJI)Ljava/lang/String;
.end method

.method private static native getAnnotListSels(JJ)[I
.end method

.method private static native getAnnotMarkupRects(JJ)[F
.end method

.method private static native getAnnotModifyDate(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotMovie(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotMovieData(JJLjava/lang/String;)Z
.end method

.method private static native getAnnotName(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotPolygonPath(JJ)J
.end method

.method private static native getAnnotPolylinePath(JJ)J
.end method

.method private static native getAnnotPopup(JJ)J
.end method

.method private static native getAnnotPopupLabel(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotPopupOpen(JJ)Z
.end method

.method private static native getAnnotPopupSubject(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotPopupText(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotRect(JJ[F)V
.end method

.method private static native getAnnotRef(JJ)J
.end method

.method private static native getAnnotRemoteDest(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotRendition(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotRenditionData(JJLjava/lang/String;)Z
.end method

.method private static native getAnnotReset(JJ)Z
.end method

.method private static native getAnnotRichMediaData(JJLjava/lang/String;Ljava/lang/String;)Z
.end method

.method private static native getAnnotRichMediaItemActived(JJ)I
.end method

.method private static native getAnnotRichMediaItemAsset(JJI)Ljava/lang/String;
.end method

.method private static native getAnnotRichMediaItemCount(JJ)I
.end method

.method private static native getAnnotRichMediaItemPara(JJI)Ljava/lang/String;
.end method

.method private static native getAnnotRichMediaItemSource(JJI)Ljava/lang/String;
.end method

.method private static native getAnnotRichMediaItemSourceData(JJILjava/lang/String;)Z
.end method

.method private static native getAnnotRichMediaItemType(JJI)I
.end method

.method private static native getAnnotSign(JJ)J
.end method

.method private static native getAnnotSignStatus(JJ)I
.end method

.method private static native getAnnotSound(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotSoundData(JJ[ILjava/lang/String;)Z
.end method

.method private static native getAnnotStrokeColor(JJ)I
.end method

.method private static native getAnnotStrokeDash(JJ)[F
.end method

.method private static native getAnnotStrokeWidth(JJ)F
.end method

.method private static native getAnnotSubmitPara(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotSubmitTarget(JJ)Ljava/lang/String;
.end method

.method private static native getAnnotType(JJ)I
.end method

.method private static native getAnnotURI(JJ)Ljava/lang/String;
.end method

.method private static native getCropBox(J)[F
.end method

.method private static native getMediaBox(J)[F
.end method

.method private static native getRotate(J)I
.end method

.method private static native importAnnot(J[F[B)Z
.end method

.method private static native insertAnnotComboItem(JJILjava/lang/String;Ljava/lang/String;)Z
.end method

.method private static native insertAnnotListItem(JJILjava/lang/String;Ljava/lang/String;)Z
.end method

.method private static native isAnnotHide(JJ)Z
.end method

.method private static native isAnnotListMultiSel(JJ)Z
.end method

.method private static native isAnnotLocked(JJ)Z
.end method

.method private static native isAnnotLockedContent(JJ)Z
.end method

.method private static native isAnnotReadOnly(JJ)Z
.end method

.method private static native moveAnnot(JJJ[F)Z
.end method

.method private static native objsAlignWord(JII)I
.end method

.method private static native objsGetCharCount(J)I
.end method

.method private static native objsGetCharFontName(JI)Ljava/lang/String;
.end method

.method private static native objsGetCharIndex(J[F)I
.end method

.method private static native objsGetCharRect(JI[F)V
.end method

.method private static native objsGetString(JII)Ljava/lang/String;
.end method

.method private static native objsStart(JZ)V
.end method

.method private static native reflow(JJFF)Z
.end method

.method private static native reflowGetCharColor(JII)I
.end method

.method private static native reflowGetCharCount(JI)I
.end method

.method private static native reflowGetCharFont(JII)Ljava/lang/String;
.end method

.method private static native reflowGetCharHeight(JII)F
.end method

.method private static native reflowGetCharRect(JII[F)V
.end method

.method private static native reflowGetCharUnicode(JII)I
.end method

.method private static native reflowGetCharWidth(JII)F
.end method

.method private static native reflowGetParaCount(J)I
.end method

.method private static native reflowGetText(JIIII)Ljava/lang/String;
.end method

.method private static native reflowStart(JFFZ)F
.end method

.method private static native reflowToBmp(JLandroid/graphics/Bitmap;FF)Z
.end method

.method private static native removeAnnot(JJ)Z
.end method

.method private static native removeAnnotComboItem(JJI)Z
.end method

.method private static native removeAnnotListItem(JJI)Z
.end method

.method private static native render(JJJI)Z
.end method

.method private static native renderAnnotToBmp(JJLandroid/graphics/Bitmap;)Z
.end method

.method private static native renderCancel(J)V
.end method

.method private static native renderIsFinished(J)Z
.end method

.method private static native renderPrepare(JJ)V
.end method

.method private static native renderThumb(JLandroid/graphics/Bitmap;)Z
.end method

.method private static native renderThumbToBuf(J[III)Z
.end method

.method private static native renderThumbToDIB(JJ)Z
.end method

.method private static native renderToBmp(JLandroid/graphics/Bitmap;JI)Z
.end method

.method private static native renderToBuf(J[IIIJI)Z
.end method

.method private static native renderToGray(JLandroid/graphics/Bitmap;JI)Z
.end method

.method private static native setAnnotCheckValue(JJZ)Z
.end method

.method private static native setAnnotComboItem(JJI)Z
.end method

.method private static native setAnnotEditFont(JJJ)Z
.end method

.method private static native setAnnotEditText(JJLjava/lang/String;)Z
.end method

.method private static native setAnnotEditText2(JJLjava/lang/String;Ljava/lang/String;)Z
.end method

.method private static native setAnnotEditTextAlign(JJI)Z
.end method

.method private static native setAnnotEditTextColor(JJI)Z
.end method

.method private static native setAnnotEditTextSize(JJF)Z
.end method

.method private static native setAnnotFillColor(JJI)Z
.end method

.method private static native setAnnotHide(JJZ)V
.end method

.method private static native setAnnotIcon(JJI)Z
.end method

.method private static native setAnnotIcon2(JJLjava/lang/String;J)Z
.end method

.method private static native setAnnotInkPath(JJJ)Z
.end method

.method private static native setAnnotLinePoint(JJFFFF)Z
.end method

.method private static native setAnnotLineStyle(JJI)Z
.end method

.method private static native setAnnotListSels(JJ[I)Z
.end method

.method private static native setAnnotLock(JJZ)V
.end method

.method private static native setAnnotModifyDate(JJLjava/lang/String;)Z
.end method

.method private static native setAnnotName(JJLjava/lang/String;)Z
.end method

.method private static native setAnnotPolygonPath(JJJ)Z
.end method

.method private static native setAnnotPolylinePath(JJJ)Z
.end method

.method private static native setAnnotPopupLabel(JJLjava/lang/String;)Z
.end method

.method private static native setAnnotPopupOpen(JJZ)Z
.end method

.method private static native setAnnotPopupSubject(JJLjava/lang/String;)Z
.end method

.method private static native setAnnotPopupText(JJLjava/lang/String;)Z
.end method

.method private static native setAnnotRadio(JJ)Z
.end method

.method private static native setAnnotReadOnly(JJZ)V
.end method

.method private static native setAnnotRect(JJ[F)V
.end method

.method private static native setAnnotReset(JJ)Z
.end method

.method private static native setAnnotStrokeColor(JJI)Z
.end method

.method private static native setAnnotStrokeDash(JJ[F)Z
.end method

.method private static native setAnnotStrokeWidth(JJF)Z
.end method

.method private static native sign(JJ[FLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private static native signAnnotField(JJJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method


# virtual methods
.method public final AddAnnot(J)Z
    .locals 2

    .line 1762
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Page;->addAnnot(JJ)Z

    move-result p1

    return p1
.end method

.method public final AddAnnot(JI)Z
    .locals 2

    .line 1766
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/radaee/pdf/Page;->addAnnot2(JJI)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotAttachment(Ljava/lang/String;I[F)Z
    .locals 2

    .line 2541
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/radaee/pdf/Page;->addAnnotAttachment(JLjava/lang/String;I[F)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotBitmap(Lcom/radaee/pdf/Document$DocImage;[F)Z
    .locals 4

    .line 2522
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Document$DocImage;->hand:J

    invoke-static {v0, v1, v2, v3, p2}, Lcom/radaee/pdf/Page;->addAnnotBitmap(JJ[F)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotEditbox(Lcom/radaee/pdf/Matrix;[FIFIIF)Z
    .locals 10

    .line 2592
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Matrix;->hand:J

    move-object v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move/from16 v9, p6

    move/from16 v8, p7

    invoke-static/range {v0 .. v9}, Lcom/radaee/pdf/Page;->addAnnotEditbox(JJ[FIFIFI)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotEditbox([FIFIFI)Z
    .locals 8

    .line 2433
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-static/range {v0 .. v7}, Lcom/radaee/pdf/Page;->addAnnotEditbox2(J[FIFIFI)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotEllipse(Lcom/radaee/pdf/Matrix;[FFII)Z
    .locals 8

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 2315
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Matrix;->hand:J

    move-object v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-static/range {v0 .. v7}, Lcom/radaee/pdf/Page;->addAnnotEllipse(JJ[FFII)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotEllipse([FFII)Z
    .locals 6

    .line 2415
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/Page;->addAnnotEllipse2(J[FFII)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotGlyph(Lcom/radaee/pdf/Matrix;Lcom/radaee/pdf/Path;IZ)Z
    .locals 8

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 2248
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Matrix;->hand:J

    iget-wide v4, p2, Lcom/radaee/pdf/Path;->m_hand:J

    move v6, p3

    move v7, p4

    invoke-static/range {v0 .. v7}, Lcom/radaee/pdf/Page;->addAnnotGlyph(JJJIZ)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final AddAnnotGoto([FIF)Z
    .locals 2

    .line 2144
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/radaee/pdf/Page;->addAnnotGoto(J[FIF)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotHWriting(Lcom/radaee/pdf/Matrix;Lcom/radaee/pdf/HWriting;FF)Z
    .locals 8

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 2231
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Matrix;->hand:J

    iget-wide v4, p2, Lcom/radaee/pdf/HWriting;->hand:J

    move v6, p3

    move v7, p4

    invoke-static/range {v0 .. v7}, Lcom/radaee/pdf/Page;->addAnnotHWriting(JJJFF)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final AddAnnotInk(Lcom/radaee/pdf/Ink;)Z
    .locals 4

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 2354
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Ink;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->addAnnotInk2(JJ)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotInk(Lcom/radaee/pdf/Matrix;Lcom/radaee/pdf/Ink;FF)Z
    .locals 8

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 2214
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Matrix;->hand:J

    iget-wide v4, p2, Lcom/radaee/pdf/Ink;->hand:J

    move v6, p3

    move v7, p4

    invoke-static/range {v0 .. v7}, Lcom/radaee/pdf/Page;->addAnnotInk(JJJFF)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final AddAnnotLine(Lcom/radaee/pdf/Matrix;[F[FIIFII)Z
    .locals 11

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 2297
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Matrix;->hand:J

    move-object v4, p2

    move-object v5, p3

    move v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    invoke-static/range {v0 .. v10}, Lcom/radaee/pdf/Page;->addAnnotLine(JJ[F[FIIFII)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotLine([F[FIIFII)Z
    .locals 9

    .line 2383
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    move/from16 v8, p7

    invoke-static/range {v0 .. v8}, Lcom/radaee/pdf/Page;->addAnnotLine2(J[F[FIIFII)Z

    move-result p1

    return p1
.end method

.method public AddAnnotMarkup(III)Z
    .locals 7

    .line 2499
    sget v0, Lcom/radaee/pdf/Global;->highlight_color:I

    const/4 v1, 0x1

    if-ne p3, v1, :cond_0

    .line 2500
    sget v0, Lcom/radaee/pdf/Global;->underline_color:I

    :cond_0
    const/4 v1, 0x2

    if-ne p3, v1, :cond_1

    .line 2501
    sget v0, Lcom/radaee/pdf/Global;->strikeout_color:I

    :cond_1
    const/4 v1, 0x4

    if-ne p3, v1, :cond_2

    .line 2502
    sget v0, Lcom/radaee/pdf/Global;->squiggle_color:I

    :cond_2
    move v5, v0

    .line 2504
    sput p1, Lcom/radaee/pdf/Page;->note_start:I

    .line 2505
    sput p2, Lcom/radaee/pdf/Page;->note_end:I

    .line 2506
    iget-wide v1, p0, Lcom/radaee/pdf/Page;->hand:J

    move v3, p1

    move v4, p2

    move v6, p3

    invoke-static/range {v1 .. v6}, Lcom/radaee/pdf/Page;->addAnnotMarkup2(JIIII)Z

    move-result p1

    return p1
.end method

.method public AddAnnotMarkup(Lcom/radaee/pdf/Matrix;[FI)Z
    .locals 8

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 2336
    :cond_0
    sget v0, Lcom/radaee/pdf/Global;->highlight_color:I

    const/4 v1, 0x1

    if-ne p3, v1, :cond_1

    .line 2337
    sget v0, Lcom/radaee/pdf/Global;->underline_color:I

    :cond_1
    const/4 v1, 0x2

    if-ne p3, v1, :cond_2

    .line 2338
    sget v0, Lcom/radaee/pdf/Global;->strikeout_color:I

    :cond_2
    const/4 v1, 0x4

    if-ne p3, v1, :cond_3

    .line 2339
    sget v0, Lcom/radaee/pdf/Global;->squiggle_color:I

    :cond_3
    move v6, v0

    .line 2340
    iget-wide v1, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p1, Lcom/radaee/pdf/Matrix;->hand:J

    move-object v5, p2

    move v7, p3

    invoke-static/range {v1 .. v7}, Lcom/radaee/pdf/Page;->addAnnotMarkup(JJ[FII)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotPolygon(Lcom/radaee/pdf/Path;IIF)Z
    .locals 7

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 2450
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Path;->m_hand:J

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-static/range {v0 .. v6}, Lcom/radaee/pdf/Page;->addAnnotPolygon(JJIIF)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotPolyline(Lcom/radaee/pdf/Path;IIIIF)Z
    .locals 9

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 2479
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Path;->m_hand:J

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move v8, p6

    invoke-static/range {v0 .. v8}, Lcom/radaee/pdf/Page;->addAnnotPolyline(JJIIIIF)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotPopup(Lcom/radaee/pdf/Page$Annotation;[FZ)Z
    .locals 6

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 2320
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Page$Annotation;->hand:J

    move-object v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/Page;->addAnnotPopup(JJ[FZ)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotRect(Lcom/radaee/pdf/Matrix;[FFII)Z
    .locals 8

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 2266
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Matrix;->hand:J

    move-object v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-static/range {v0 .. v7}, Lcom/radaee/pdf/Page;->addAnnotRect(JJ[FFII)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final AddAnnotRect([FFII)Z
    .locals 6

    .line 2399
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/Page;->addAnnotRect2(J[FFII)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotRichMedia(Ljava/lang/String;Ljava/lang/String;ILcom/radaee/pdf/Document$DocImage;[F)Z
    .locals 8

    .line 2560
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v5, p4, Lcom/radaee/pdf/Document$DocImage;->hand:J

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v7, p5

    invoke-static/range {v0 .. v7}, Lcom/radaee/pdf/Page;->addAnnotRichMedia(JLjava/lang/String;Ljava/lang/String;IJ[F)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotStamp([FI)Z
    .locals 2

    .line 2196
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Page;->addAnnotStamp(J[FI)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotText([F)Z
    .locals 2

    .line 2573
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Page;->addAnnotText(J[F)Z

    move-result p1

    return p1
.end method

.method public final AddAnnotURI([FLjava/lang/String;)Z
    .locals 2

    .line 2158
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Page;->addAnnotURI(J[FLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public AddContent(Lcom/radaee/pdf/PageContent;Z)Z
    .locals 4

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 2820
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/PageContent;->hand:J

    invoke-static {v0, v1, v2, v3, p2}, Lcom/radaee/pdf/Page;->addContent(JJZ)Z

    move-result p1

    return p1
.end method

.method public AddResFont(Lcom/radaee/pdf/Document$DocFont;)Lcom/radaee/pdf/ResFont;
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 2747
    :cond_0
    iget-wide v1, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p1, Lcom/radaee/pdf/Document$DocFont;->hand:J

    invoke-static {v1, v2, v3, v4}, Lcom/radaee/pdf/Page;->addResFont(JJ)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-eqz p1, :cond_1

    .line 2750
    new-instance p1, Lcom/radaee/pdf/ResFont;

    invoke-direct {p1}, Lcom/radaee/pdf/ResFont;-><init>()V

    .line 2751
    iput-wide v1, p1, Lcom/radaee/pdf/ResFont;->hand:J

    return-object p1

    :cond_1
    return-object v0
.end method

.method public AddResForm(Lcom/radaee/pdf/Document$DocForm;)Lcom/radaee/pdf/ResForm;
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 2802
    :cond_0
    iget-wide v1, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p1, Lcom/radaee/pdf/Document$DocForm;->hand:J

    invoke-static {v1, v2, v3, v4}, Lcom/radaee/pdf/Page;->addResForm(JJ)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-nez p1, :cond_1

    return-object v0

    .line 2804
    :cond_1
    new-instance p1, Lcom/radaee/pdf/ResForm;

    invoke-direct {p1}, Lcom/radaee/pdf/ResForm;-><init>()V

    .line 2805
    iput-wide v1, p1, Lcom/radaee/pdf/ResForm;->hand:J

    return-object p1
.end method

.method public AddResGState(Lcom/radaee/pdf/Document$DocGState;)Lcom/radaee/pdf/ResGState;
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 2783
    :cond_0
    iget-wide v1, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p1, Lcom/radaee/pdf/Document$DocGState;->hand:J

    invoke-static {v1, v2, v3, v4}, Lcom/radaee/pdf/Page;->addResGState(JJ)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-eqz p1, :cond_1

    .line 2786
    new-instance p1, Lcom/radaee/pdf/ResGState;

    invoke-direct {p1}, Lcom/radaee/pdf/ResGState;-><init>()V

    .line 2787
    iput-wide v1, p1, Lcom/radaee/pdf/ResGState;->hand:J

    return-object p1

    :cond_1
    return-object v0
.end method

.method public AddResImage(Lcom/radaee/pdf/Document$DocImage;)Lcom/radaee/pdf/ResImage;
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 2765
    :cond_0
    iget-wide v1, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p1, Lcom/radaee/pdf/Document$DocImage;->hand:J

    invoke-static {v1, v2, v3, v4}, Lcom/radaee/pdf/Page;->addResImage(JJ)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-eqz p1, :cond_1

    .line 2768
    new-instance p1, Lcom/radaee/pdf/ResImage;

    invoke-direct {p1}, Lcom/radaee/pdf/ResImage;-><init>()V

    .line 2769
    iput-wide v1, p1, Lcom/radaee/pdf/ResImage;->hand:J

    return-object p1

    :cond_1
    return-object v0
.end method

.method public final Advance_GetRef()Lcom/radaee/pdf/adv/Ref;
    .locals 5

    .line 1730
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->advGetRef(J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 1732
    :cond_0
    new-instance v2, Lcom/radaee/pdf/adv/Ref;

    invoke-direct {v2, v0, v1}, Lcom/radaee/pdf/adv/Ref;-><init>(J)V

    return-object v2
.end method

.method public final Advance_Reload()V
    .locals 2

    .line 1742
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->advReload(J)V

    return-void
.end method

.method public final Close()V
    .locals 7

    .line 1792
    :try_start_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    const-wide/16 v2, 0x0

    .line 1793
    iput-wide v2, p0, Lcom/radaee/pdf/Page;->hand:J

    .line 1794
    iget-object v4, p0, Lcom/radaee/pdf/Page;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v4, :cond_1

    .line 1796
    iget-wide v4, v4, Lcom/radaee/pdf/Document;->hand_val:J

    cmp-long v6, v4, v2

    if-eqz v6, :cond_0

    .line 1797
    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->close(J)V

    goto :goto_0

    .line 1799
    :cond_0
    const-string v0, "Bad Coding"

    const-string v1, "Document object closed, but Page object not closed, will cause memory leaks."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const/4 v0, 0x0

    .line 1800
    iput-object v0, p0, Lcom/radaee/pdf/Page;->m_doc:Lcom/radaee/pdf/Document;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 1803
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_1
    return-void
.end method

.method public CopyAnnot(Lcom/radaee/pdf/Page$Annotation;[F)Z
    .locals 4

    .line 2831
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Page$Annotation;->hand:J

    invoke-static {v0, v1, v2, v3, p2}, Lcom/radaee/pdf/Page;->copyAnnot(JJ[F)Z

    move-result p1

    return p1
.end method

.method public FindOpen(Ljava/lang/String;ZZ)Lcom/radaee/pdf/Page$Finder;
    .locals 2

    .line 2048
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/radaee/pdf/Page;->findOpen(JLjava/lang/String;ZZ)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long p3, p1, v0

    if-nez p3, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 2050
    :cond_0
    new-instance p3, Lcom/radaee/pdf/Page$Finder;

    invoke-direct {p3, p0}, Lcom/radaee/pdf/Page$Finder;-><init>(Lcom/radaee/pdf/Page;)V

    .line 2051
    iput-wide p1, p3, Lcom/radaee/pdf/Page$Finder;->hand:J

    return-object p3
.end method

.method public FindOpen(Ljava/lang/String;ZZZ)Lcom/radaee/pdf/Page$Finder;
    .locals 6

    .line 2066
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/Page;->findOpen2(JLjava/lang/String;ZZZ)J

    move-result-wide p1

    const-wide/16 p3, 0x0

    cmp-long v0, p1, p3

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 2068
    :cond_0
    new-instance p3, Lcom/radaee/pdf/Page$Finder;

    invoke-direct {p3, p0}, Lcom/radaee/pdf/Page$Finder;-><init>(Lcom/radaee/pdf/Page;)V

    .line 2069
    iput-wide p1, p3, Lcom/radaee/pdf/Page$Finder;->hand:J

    return-object p3
.end method

.method public FlatAnnots()Z
    .locals 2

    .line 2840
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->flate(J)Z

    move-result v0

    return v0
.end method

.method public GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;
    .locals 4

    .line 2100
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Page;->getAnnot(JI)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 2102
    :cond_0
    new-instance p1, Lcom/radaee/pdf/Page$Annotation;

    invoke-direct {p1, p0, v0, v1}, Lcom/radaee/pdf/Page$Annotation;-><init>(Lcom/radaee/pdf/Page;J)V

    return-object p1
.end method

.method public GetAnnotByName(Ljava/lang/String;)Lcom/radaee/pdf/Page$Annotation;
    .locals 4

    .line 2127
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Page;->getAnnotByName(JLjava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 2129
    :cond_0
    new-instance p1, Lcom/radaee/pdf/Page$Annotation;

    invoke-direct {p1, p0, v0, v1}, Lcom/radaee/pdf/Page$Annotation;-><init>(Lcom/radaee/pdf/Page;J)V

    return-object p1
.end method

.method public final GetAnnotCount()I
    .locals 2

    .line 2089
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->getAnnotCount(J)I

    move-result v0

    return v0
.end method

.method public GetAnnotFromPoint(FF)Lcom/radaee/pdf/Page$Annotation;
    .locals 3

    .line 2114
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Page;->getAnnotFromPoint(JFF)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 2116
    :cond_0
    new-instance v0, Lcom/radaee/pdf/Page$Annotation;

    invoke-direct {v0, p0, p1, p2}, Lcom/radaee/pdf/Page$Annotation;-><init>(Lcom/radaee/pdf/Page;J)V

    return-object v0
.end method

.method public final GetCropBox()[F
    .locals 2

    .line 1750
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->getCropBox(J)[F

    move-result-object v0

    return-object v0
.end method

.method public final GetMediaBox()[F
    .locals 2

    .line 1758
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->getMediaBox(J)[F

    move-result-object v0

    return-object v0
.end method

.method public final GetRotate()I
    .locals 2

    .line 2079
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->getRotate(J)I

    move-result v0

    return v0
.end method

.method public ImportAnnot([F[B)Z
    .locals 2

    .line 2852
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Page;->importAnnot(J[F[B)Z

    move-result p1

    return p1
.end method

.method public final ObjsAlignWord(II)I
    .locals 2

    .line 2001
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Page;->objsAlignWord(JII)I

    move-result p1

    return p1
.end method

.method public final ObjsGetCharCount()I
    .locals 2

    .line 2028
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->objsGetCharCount(J)I

    move-result v0

    return v0
.end method

.method public ObjsGetCharFontName(I)Ljava/lang/String;
    .locals 2

    .line 2019
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Page;->objsGetCharFontName(JI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final ObjsGetCharIndex([F)I
    .locals 2

    .line 2037
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Page;->objsGetCharIndex(J[F)I

    move-result p1

    return p1
.end method

.method public final ObjsGetCharRect(I[F)V
    .locals 2

    .line 2010
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Page;->objsGetCharRect(JI[F)V

    return-void
.end method

.method public final ObjsGetString(II)Ljava/lang/String;
    .locals 2

    .line 1991
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Page;->objsGetString(JII)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final ObjsStart()V
    .locals 3

    .line 1981
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    sget-boolean v2, Lcom/radaee/pdf/Global;->selRTOL:Z

    invoke-static {v0, v1, v2}, Lcom/radaee/pdf/Page;->objsStart(JZ)V

    return-void
.end method

.method public final Reflow(Lcom/radaee/pdf/DIB;FF)Z
    .locals 6

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 2617
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/DIB;->hand:J

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/Page;->reflow(JJFF)Z

    move-result p1

    return p1
.end method

.method public final ReflowGetCharColor(II)I
    .locals 2

    if-ltz p2, :cond_1

    .line 2684
    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Page;->ReflowGetCharCount(I)I

    move-result v0

    if-lt p2, v0, :cond_0

    goto :goto_0

    .line 2685
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Page;->reflowGetCharColor(JII)I

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final ReflowGetCharCount(I)I
    .locals 2

    if-ltz p1, :cond_1

    .line 2648
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->reflowGetParaCount(J)I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 2649
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Page;->reflowGetCharCount(JI)I

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final ReflowGetCharFont(II)Ljava/lang/String;
    .locals 2

    if-ltz p2, :cond_1

    .line 2708
    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Page;->ReflowGetCharCount(I)I

    move-result v0

    if-lt p2, v0, :cond_0

    goto :goto_0

    .line 2709
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Page;->reflowGetCharFont(JII)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public final ReflowGetCharHeight(II)F
    .locals 2

    if-ltz p2, :cond_1

    .line 2672
    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Page;->ReflowGetCharCount(I)I

    move-result v0

    if-lt p2, v0, :cond_0

    goto :goto_0

    .line 2673
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Page;->reflowGetCharHeight(JII)F

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final ReflowGetCharRect(II[F)V
    .locals 2

    if-ltz p2, :cond_1

    .line 2720
    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Page;->ReflowGetCharCount(I)I

    move-result v0

    if-lt p2, v0, :cond_0

    goto :goto_0

    .line 2721
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/radaee/pdf/Page;->reflowGetCharRect(JII[F)V

    :cond_1
    :goto_0
    return-void
.end method

.method public final ReflowGetCharUnicode(II)I
    .locals 2

    if-ltz p2, :cond_1

    .line 2696
    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Page;->ReflowGetCharCount(I)I

    move-result v0

    if-lt p2, v0, :cond_0

    goto :goto_0

    .line 2697
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Page;->reflowGetCharUnicode(JII)I

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final ReflowGetCharWidth(II)F
    .locals 2

    if-ltz p2, :cond_1

    .line 2660
    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Page;->ReflowGetCharCount(I)I

    move-result v0

    if-lt p2, v0, :cond_0

    goto :goto_0

    .line 2661
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Page;->reflowGetCharWidth(JII)F

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final ReflowGetParaCount()I
    .locals 2

    .line 2638
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->reflowGetParaCount(J)I

    move-result v0

    return v0
.end method

.method public ReflowGetText(IIII)Ljava/lang/String;
    .locals 8

    const/4 v0, 0x0

    if-ltz p2, :cond_2

    .line 2734
    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Page;->ReflowGetCharCount(I)I

    move-result v1

    if-lt p2, v1, :cond_0

    goto :goto_0

    :cond_0
    if-ltz p4, :cond_2

    .line 2735
    invoke-virtual {p0, p3}, Lcom/radaee/pdf/Page;->ReflowGetCharCount(I)I

    move-result v1

    if-lt p2, v1, :cond_1

    goto :goto_0

    .line 2736
    :cond_1
    iget-wide v2, p0, Lcom/radaee/pdf/Page;->hand:J

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-static/range {v2 .. v7}, Lcom/radaee/pdf/Page;->reflowGetText(JIIII)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    :goto_0
    return-object v0
.end method

.method public final ReflowStart(FFZ)F
    .locals 2

    .line 2604
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/radaee/pdf/Page;->reflowStart(JFFZ)F

    move-result p1

    return p1
.end method

.method public final ReflowToBmp(Landroid/graphics/Bitmap;FF)Z
    .locals 2

    .line 2629
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/radaee/pdf/Page;->reflowToBmp(JLandroid/graphics/Bitmap;FF)Z

    move-result p1

    return p1
.end method

.method public final Render(Lcom/radaee/pdf/DIB;Lcom/radaee/pdf/Matrix;)Z
    .locals 9

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 1838
    :cond_0
    :try_start_0
    iget-wide v2, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v4, p1, Lcom/radaee/pdf/DIB;->hand:J

    iget-wide v6, p2, Lcom/radaee/pdf/Matrix;->hand:J

    sget v8, Lcom/radaee/pdf/Global;->render_mode:I

    invoke-static/range {v2 .. v8}, Lcom/radaee/pdf/Page;->render(JJJI)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1842
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    :goto_0
    return v1
.end method

.method public final RenderCancel()V
    .locals 2

    .line 1917
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->renderCancel(J)V

    return-void
.end method

.method public final RenderIsFinished()Z
    .locals 2

    .line 1973
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Page;->renderIsFinished(J)Z

    move-result v0

    return v0
.end method

.method public final RenderPrepare(Landroid/graphics/Bitmap;)V
    .locals 4

    if-eqz p1, :cond_0

    const/4 v0, -0x1

    .line 1825
    invoke-virtual {p1, v0}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 1826
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->renderPrepare(JJ)V

    return-void
.end method

.method public final RenderPrepare(Lcom/radaee/pdf/DIB;)V
    .locals 4

    if-nez p1, :cond_0

    .line 1814
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->renderPrepare(JJ)V

    return-void

    .line 1816
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/DIB;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Page;->renderPrepare(JJ)V

    return-void
.end method

.method public final RenderThumb(Landroid/graphics/Bitmap;)Z
    .locals 2

    .line 1928
    :try_start_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Page;->renderThumb(JLandroid/graphics/Bitmap;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 1932
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p1, 0x0

    return p1
.end method

.method public final RenderThumbToBuf([III)Z
    .locals 2

    .line 1959
    :try_start_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/radaee/pdf/Page;->renderThumbToBuf(J[III)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 1963
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p1, 0x0

    return p1
.end method

.method public final RenderThumbToDIB(Lcom/radaee/pdf/DIB;)Z
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 1940
    :cond_0
    :try_start_0
    iget-wide v1, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p1, Lcom/radaee/pdf/DIB;->hand:J

    invoke-static {v1, v2, v3, v4}, Lcom/radaee/pdf/Page;->renderThumbToDIB(JJ)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 1944
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return v0
.end method

.method public final RenderToBmp(Landroid/graphics/Bitmap;Lcom/radaee/pdf/Matrix;)Z
    .locals 8

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 1857
    :cond_0
    :try_start_0
    iget-wide v2, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v5, p2, Lcom/radaee/pdf/Matrix;->hand:J

    sget v7, Lcom/radaee/pdf/Global;->render_mode:I

    move-object v4, p1

    invoke-static/range {v2 .. v7}, Lcom/radaee/pdf/Page;->renderToBmp(JLandroid/graphics/Bitmap;JI)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1861
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    :goto_0
    return v1
.end method

.method public final RenderToBuf([IIILcom/radaee/pdf/Matrix;)Z
    .locals 10

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    if-nez p4, :cond_0

    goto :goto_0

    .line 1889
    :cond_0
    :try_start_0
    iget-wide v2, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v7, p4, Lcom/radaee/pdf/Matrix;->hand:J

    sget v9, Lcom/radaee/pdf/Global;->render_mode:I

    move-object v4, p1

    move v5, p2

    move v6, p3

    invoke-static/range {v2 .. v9}, Lcom/radaee/pdf/Page;->renderToBuf(J[IIIJI)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1892
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    :goto_0
    return v1
.end method

.method public final RenderToGrayBmp(Landroid/graphics/Bitmap;Lcom/radaee/pdf/Matrix;)Z
    .locals 6

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 1874
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v3, p2, Lcom/radaee/pdf/Matrix;->hand:J

    sget v5, Lcom/radaee/pdf/Global;->render_mode:I

    move-object v2, p1

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/Page;->renderToGray(JLandroid/graphics/Bitmap;JI)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final Render_Normal(Lcom/radaee/pdf/DIB;Lcom/radaee/pdf/Matrix;)Z
    .locals 9

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 1905
    :cond_0
    :try_start_0
    iget-wide v2, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v4, p1, Lcom/radaee/pdf/DIB;->hand:J

    iget-wide v6, p2, Lcom/radaee/pdf/Matrix;->hand:J

    const/4 v8, 0x1

    invoke-static/range {v2 .. v8}, Lcom/radaee/pdf/Page;->render(JJJI)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1908
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    :goto_0
    return v1
.end method

.method public Sign(Lcom/radaee/pdf/Document$DocForm;[FLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 11

    .line 1784
    iget-wide v0, p0, Lcom/radaee/pdf/Page;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Document$DocForm;->hand:J

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    invoke-static/range {v0 .. v10}, Lcom/radaee/pdf/Page;->sign(JJ[FLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 2857
    invoke-virtual {p0}, Lcom/radaee/pdf/Page;->Close()V

    .line 2858
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
