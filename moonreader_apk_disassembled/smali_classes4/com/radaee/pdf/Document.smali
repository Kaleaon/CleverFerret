.class public Lcom/radaee/pdf/Document;
.super Ljava/lang/Object;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/pdf/Document$PDFStream;,
        Lcom/radaee/pdf/Document$PDFFontDelegate;,
        Lcom/radaee/pdf/Document$PDFJSDelegate;,
        Lcom/radaee/pdf/Document$Outline;,
        Lcom/radaee/pdf/Document$ImportContext;,
        Lcom/radaee/pdf/Document$DocFont;,
        Lcom/radaee/pdf/Document$DocGState;,
        Lcom/radaee/pdf/Document$DocImage;,
        Lcom/radaee/pdf/Document$DocForm;
    }
.end annotation


# instance fields
.field protected hand_val:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 631
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 259
    iput-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    .line 638
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 642
    iput-wide p1, p0, Lcom/radaee/pdf/Document;->hand_val:J

    return-void
.end method

.method public static BundleRestore(Landroid/os/Bundle;)Lcom/radaee/pdf/Document;
    .locals 5

    const/4 v0, 0x0

    .line 1558
    :try_start_0
    const-string v1, "pdf_doc_handle"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p0, v1, v3

    if-eqz p0, :cond_0

    .line 1561
    new-instance p0, Lcom/radaee/pdf/Document;

    invoke-direct {p0}, Lcom/radaee/pdf/Document;-><init>()V

    .line 1562
    iput-wide v1, p0, Lcom/radaee/pdf/Document;->hand_val:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    :cond_0
    return-object v0
.end method

.method public static BundleSave(Landroid/os/Bundle;Lcom/radaee/pdf/Document;)V
    .locals 3

    .line 1552
    const-string v0, "pdf_doc_handle"

    iget-wide v1, p1, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    return-void
.end method

.method public static SetOpenFlag(I)V
    .locals 0

    .line 725
    invoke-static {p0}, Lcom/radaee/pdf/Document;->setOpenFlag(I)V

    return-void
.end method

.method static synthetic access$000(JJII)Z
    .locals 0

    .line 16
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Document;->importPage(JJII)Z

    move-result p0

    return p0
.end method

.method static synthetic access$100(JJ)V
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Document;->importEnd(JJ)V

    return-void
.end method

.method static synthetic access$1000(JJLjava/lang/String;IF)Z
    .locals 0

    .line 16
    invoke-static/range {p0 .. p6}, Lcom/radaee/pdf/Document;->addOutlineChild(JJLjava/lang/String;IF)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1100(JJ)Z
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Document;->removeOutline(JJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1200(JJ)F
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Document;->getFontAscent(JJ)F

    move-result p0

    return p0
.end method

.method static synthetic access$1300(JJ)F
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Document;->getFontDescent(JJ)F

    move-result p0

    return p0
.end method

.method static synthetic access$1400(JJI)Z
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Document;->setGStateFillAlpha(JJI)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1500(JJI)Z
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Document;->setGStateStrokeAlpha(JJI)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1600(JJ[FF)Z
    .locals 0

    .line 16
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Document;->setGStateStrokeDash(JJ[FF)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1700(JJI)Z
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Document;->setGStateBlendMode(JJI)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1800(JJJ)J
    .locals 0

    .line 16
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Document;->addFormResFont(JJJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$1900(JJJ)J
    .locals 0

    .line 16
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Document;->addFormResImage(JJJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$200(JJ)Ljava/lang/String;
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Document;->getOutlineTitle(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2000(JJJ)J
    .locals 0

    .line 16
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Document;->addFormResGState(JJJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$2100(JJJ)J
    .locals 0

    .line 16
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Document;->addFormResForm(JJJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$2200(JJFFFFJ)V
    .locals 0

    .line 16
    invoke-static/range {p0 .. p9}, Lcom/radaee/pdf/Document;->setFormContent(JJFFFFJ)V

    return-void
.end method

.method static synthetic access$2300(JJZZ)V
    .locals 0

    .line 16
    invoke-static/range {p0 .. p5}, Lcom/radaee/pdf/Document;->setFormTransparency(JJZZ)V

    return-void
.end method

.method static synthetic access$2400(JJ)V
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Document;->freeForm(JJ)V

    return-void
.end method

.method static synthetic access$300(JJLjava/lang/String;)Z
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3, p4}, Lcom/radaee/pdf/Document;->setOutlineTitle(JJLjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$400(JJ)J
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Document;->getOutlineNext(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$500(JJ)J
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Document;->getOutlineChild(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$600(JJ)I
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Document;->getOutlineDest(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic access$700(JJ)Ljava/lang/String;
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Document;->getOutlineURI(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$800(JJ)Ljava/lang/String;
    .locals 0

    .line 16
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/Document;->getOutlineFileLink(JJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(JJLjava/lang/String;IF)Z
    .locals 0

    .line 16
    invoke-static/range {p0 .. p6}, Lcom/radaee/pdf/Document;->addOutlineNext(JJLjava/lang/String;IF)Z

    move-result p0

    return p0
.end method

.method private static native addFormResFont(JJJ)J
.end method

.method private static native addFormResForm(JJJ)J
.end method

.method private static native addFormResGState(JJJ)J
.end method

.method private static native addFormResImage(JJJ)J
.end method

.method private static native addOutlineChild(JJLjava/lang/String;IF)Z
.end method

.method private static native addOutlineNext(JJLjava/lang/String;IF)Z
.end method

.method private static native advGetObj(JJ)J
.end method

.method private static native advGetRef(J)J
.end method

.method private static native advNewFlateStream(J[B)J
.end method

.method private static native advNewIndirectObj(J)J
.end method

.method private static native advNewIndirectObjWithData(JJ)J
.end method

.method private static native advNewRawStream(J[B)J
.end method

.method private static native advReload(J)V
.end method

.method private static adv_create_obj(J)Lcom/radaee/pdf/adv/Obj;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 360
    :cond_0
    new-instance v0, Lcom/radaee/pdf/adv/Obj;

    invoke-direct {v0, p0, p1}, Lcom/radaee/pdf/adv/Obj;-><init>(J)V

    return-object v0
.end method

.method private static adv_create_ref(J)Lcom/radaee/pdf/adv/Ref;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 355
    :cond_0
    new-instance v0, Lcom/radaee/pdf/adv/Ref;

    invoke-direct {v0, p0, p1}, Lcom/radaee/pdf/adv/Ref;-><init>(J)V

    return-object v0
.end method

.method private static native canSave(J)Z
.end method

.method private static native changePageRect(JIFFFF)Z
.end method

.method private static native close(J)V
.end method

.method private static native create(Ljava/lang/String;)J
.end method

.method private static native createForStream(Lcom/radaee/pdf/Document$PDFStream;)J
.end method

.method private static native encryptAs(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;II[B)Z
.end method

.method private static native exportForm(J)Ljava/lang/String;
.end method

.method private static native freeForm(JJ)V
.end method

.method private static native getEFCount(J)I
.end method

.method private static native getEFData(JILjava/lang/String;)Z
.end method

.method private static native getEFDesc(JI)Ljava/lang/String;
.end method

.method private static native getEFName(JI)Ljava/lang/String;
.end method

.method private static native getFontAscent(JJ)F
.end method

.method private static native getFontDescent(JJ)F
.end method

.method private static native getID(JI)[B
.end method

.method private static native getJS(JI)Ljava/lang/String;
.end method

.method private static native getJSCount(J)I
.end method

.method private static native getJSName(JI)Ljava/lang/String;
.end method

.method private static native getLinearizedStatus(J)I
.end method

.method private static native getMeta(JLjava/lang/String;)Ljava/lang/String;
.end method

.method private static native getOutlineChild(JJ)J
.end method

.method private static native getOutlineDest(JJ)I
.end method

.method private static native getOutlineFileLink(JJ)Ljava/lang/String;
.end method

.method private static native getOutlineNext(JJ)J
.end method

.method private getOutlineRoot()J
    .locals 4

    .line 646
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->getOutlineNext(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private static native getOutlineTitle(JJ)Ljava/lang/String;
.end method

.method private static native getOutlineURI(JJ)Ljava/lang/String;
.end method

.method private static native getPage(JI)J
.end method

.method private static native getPage0(J)J
.end method

.method private static native getPageCount(J)I
.end method

.method private static native getPageHeight(JI)F
.end method

.method private static native getPageLabel(JI)Ljava/lang/String;
.end method

.method private static native getPageWidth(JI)F
.end method

.method private static native getPagesMaxSize(J)[F
.end method

.method private static native getPerm(J)I
.end method

.method private static native getPermission(J)I
.end method

.method private static native getXMP(J)Ljava/lang/String;
.end method

.method private static native importEnd(JJ)V
.end method

.method private static native importPage(JJII)Z
.end method

.method private static native importStart(JJ)J
.end method

.method private static native isEncrypted(J)Z
.end method

.method private static native movePage(JII)Z
.end method

.method private static native newFontCID(JLjava/lang/String;I)J
.end method

.method private static native newForm(J)J
.end method

.method private static native newGState(J)J
.end method

.method private static native newImage(JLandroid/graphics/Bitmap;Z)J
.end method

.method private static native newImage2(JLandroid/graphics/Bitmap;I)J
.end method

.method private static native newImageJPEG(JLjava/lang/String;)J
.end method

.method private static native newImageJPEGByArray(J[BI)J
.end method

.method private static native newImageJPX(JLjava/lang/String;)J
.end method

.method private static native newPage(JIFF)J
.end method

.method private static native open(Ljava/lang/String;Ljava/lang/String;)J
.end method

.method private static native openMem([BLjava/lang/String;)J
.end method

.method private static native openMemWithCert([BLjava/lang/String;Ljava/lang/String;)J
.end method

.method private static native openStream(Lcom/radaee/pdf/Document$PDFStream;Ljava/lang/String;)J
.end method

.method private static native openStreamWithCert(Lcom/radaee/pdf/Document$PDFStream;Ljava/lang/String;Ljava/lang/String;)J
.end method

.method private static native openWithCert(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J
.end method

.method private static native removeOutline(JJ)Z
.end method

.method private static native removePage(JI)Z
.end method

.method private static native runJS(JLjava/lang/String;Lcom/radaee/pdf/Document$PDFJSDelegate;)Z
.end method

.method private static native save(J)Z
.end method

.method private static native saveAs(JLjava/lang/String;Z)Z
.end method

.method private static native setCache(JLjava/lang/String;)Z
.end method

.method private static native setFontDel(JLcom/radaee/pdf/Document$PDFFontDelegate;)V
.end method

.method private static native setFormContent(JJFFFFJ)V
.end method

.method private static native setFormTransparency(JJZZ)V
.end method

.method private static native setGStateBlendMode(JJI)Z
.end method

.method private static native setGStateFillAlpha(JJI)Z
.end method

.method private static native setGStateStrokeAlpha(JJI)Z
.end method

.method private static native setGStateStrokeDash(JJ[FF)Z
.end method

.method private static native setMeta(JLjava/lang/String;Ljava/lang/String;)Z
.end method

.method private static native setOpenFlag(I)V
.end method

.method private static native setOutlineTitle(JJLjava/lang/String;)Z
.end method

.method private static native setPageRotate(JII)Z
.end method

.method private static native setXMP(JLjava/lang/String;)Z
.end method

.method private static native verifySign(JJ)I
.end method


# virtual methods
.method public Advance_GetObj(Lcom/radaee/pdf/adv/Ref;)Lcom/radaee/pdf/adv/Obj;
    .locals 4

    .line 376
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-virtual {p1}, Lcom/radaee/pdf/adv/Ref;->get_hand()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->advGetObj(JJ)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->adv_create_obj(J)Lcom/radaee/pdf/adv/Obj;

    move-result-object p1

    return-object p1
.end method

.method public Advance_GetRef()Lcom/radaee/pdf/adv/Ref;
    .locals 2

    .line 431
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->advGetRef(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->adv_create_ref(J)Lcom/radaee/pdf/adv/Ref;

    move-result-object v0

    return-object v0
.end method

.method public Advance_NewFlateStream([B)Lcom/radaee/pdf/adv/Ref;
    .locals 2

    .line 409
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->advNewFlateStream(J[B)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->adv_create_ref(J)Lcom/radaee/pdf/adv/Ref;

    move-result-object p1

    return-object p1
.end method

.method public Advance_NewIndirectAndCopyObj(Lcom/radaee/pdf/adv/Obj;)Lcom/radaee/pdf/adv/Ref;
    .locals 4

    .line 397
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-virtual {p1}, Lcom/radaee/pdf/adv/Obj;->get_hand()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->advNewIndirectObjWithData(JJ)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->adv_create_ref(J)Lcom/radaee/pdf/adv/Ref;

    move-result-object p1

    return-object p1
.end method

.method public Advance_NewIndirectObj()Lcom/radaee/pdf/adv/Ref;
    .locals 2

    .line 386
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->advNewIndirectObj(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->adv_create_ref(J)Lcom/radaee/pdf/adv/Ref;

    move-result-object v0

    return-object v0
.end method

.method public Advance_NewRawStream([B)Lcom/radaee/pdf/adv/Ref;
    .locals 2

    .line 422
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->advNewRawStream(J[B)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->adv_create_ref(J)Lcom/radaee/pdf/adv/Ref;

    move-result-object p1

    return-object p1
.end method

.method public Advance_Reload()V
    .locals 2

    .line 440
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->advReload(J)V

    return-void
.end method

.method public CanSave()Z
    .locals 2

    .line 1221
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->canSave(J)Z

    move-result v0

    return v0
.end method

.method public ChangePageRect(IFFFF)Z
    .locals 7

    .line 1526
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/radaee/pdf/Document;->changePageRect(JIFFFF)Z

    move-result p1

    return p1
.end method

.method public Close()V
    .locals 5

    .line 1039
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 1040
    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->close(J)V

    .line 1041
    :cond_0
    iput-wide v2, p0, Lcom/radaee/pdf/Document;->hand_val:J

    return-void
.end method

.method public Create(Ljava/lang/String;)I
    .locals 7

    .line 663
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    .line 666
    invoke-static {p1}, Lcom/radaee/pdf/Document;->create(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    cmp-long p1, v0, v3

    if-gtz p1, :cond_0

    const-wide/16 v5, -0xa

    cmp-long p1, v0, v5

    if-ltz p1, :cond_0

    long-to-int p1, v0

    .line 670
    iput-wide v3, p0, Lcom/radaee/pdf/Document;->hand_val:J

    return p1

    :cond_0
    return v2
.end method

.method public CreateForStream(Lcom/radaee/pdf/Document$PDFStream;)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 683
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    .line 686
    invoke-static {p1}, Lcom/radaee/pdf/Document;->createForStream(Lcom/radaee/pdf/Document$PDFStream;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    cmp-long p1, v0, v3

    if-gtz p1, :cond_0

    const-wide/16 v5, -0xa

    cmp-long p1, v0, v5

    if-ltz p1, :cond_0

    long-to-int p1, v0

    .line 690
    iput-wide v3, p0, Lcom/radaee/pdf/Document;->hand_val:J

    return p1

    :cond_0
    return v2
.end method

.method public CreateVNPage(IIILandroid/graphics/Bitmap$Config;)J
    .locals 6

    .line 1581
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/VNPage;->create(JIIILandroid/graphics/Bitmap$Config;)J

    move-result-wide p1

    return-wide p1
.end method

.method public EncryptAs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II[B)Z
    .locals 8

    .line 1276
    :try_start_0
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    move-object v7, p6

    invoke-static/range {v0 .. v7}, Lcom/radaee/pdf/Document;->encryptAs(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;II[B)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1280
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p1, 0x0

    return p1
.end method

.method public ExportForm()Ljava/lang/String;
    .locals 2

    .line 1032
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->exportForm(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public GetEmbedFileData(ILjava/lang/String;)Z
    .locals 2

    .line 965
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Document;->getEFData(JILjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public GetEmbedFileDesc(I)Ljava/lang/String;
    .locals 2

    .line 954
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->getEFDesc(JI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public GetEmbedFileName(I)Ljava/lang/String;
    .locals 2

    .line 944
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->getEFName(JI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public GetEmbedFilesCount()I
    .locals 2

    .line 934
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->getEFCount(J)I

    move-result v0

    return v0
.end method

.method public GetID(I)[B
    .locals 2

    .line 1189
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->getID(JI)[B

    move-result-object p1

    return-object p1
.end method

.method public GetJS(I)Ljava/lang/String;
    .locals 2

    .line 994
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->getJS(JI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public GetJSCount()I
    .locals 2

    .line 974
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->getJSCount(J)I

    move-result v0

    return v0
.end method

.method public GetJSName(I)Ljava/lang/String;
    .locals 2

    .line 984
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->getJSName(JI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public GetLinearizedStatus()I
    .locals 2

    .line 1052
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->getLinearizedStatus(J)I

    move-result v0

    return v0
.end method

.method public GetMeta(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1160
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->getMeta(JLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public GetOutlines()Lcom/radaee/pdf/Document$Outline;
    .locals 5

    .line 1208
    invoke-direct {p0}, Lcom/radaee/pdf/Document;->getOutlineRoot()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 1210
    :cond_0
    new-instance v2, Lcom/radaee/pdf/Document$Outline;

    invoke-direct {v2, p0}, Lcom/radaee/pdf/Document$Outline;-><init>(Lcom/radaee/pdf/Document;)V

    .line 1211
    iput-wide v0, v2, Lcom/radaee/pdf/Document$Outline;->hand:J

    return-object v2
.end method

.method public GetPage(I)Lcom/radaee/pdf/Page;
    .locals 6

    .line 1080
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    return-object v2

    .line 1081
    :cond_0
    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->getPage(JI)J

    move-result-wide v0

    cmp-long v5, v0, v3

    if-nez v5, :cond_1

    return-object v2

    .line 1083
    :cond_1
    new-instance v2, Lcom/radaee/pdf/Page;

    invoke-direct {v2}, Lcom/radaee/pdf/Page;-><init>()V

    .line 1086
    iput-wide v0, v2, Lcom/radaee/pdf/Page;->hand:J

    .line 1087
    iput-object p0, v2, Lcom/radaee/pdf/Page;->m_doc:Lcom/radaee/pdf/Document;

    .line 1088
    iput p1, v2, Lcom/radaee/pdf/Page;->pageno:I

    return-object v2
.end method

.method public GetPage0()Lcom/radaee/pdf/Page;
    .locals 6

    .line 1061
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    return-object v2

    .line 1062
    :cond_0
    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->getPage0(J)J

    move-result-wide v0

    cmp-long v5, v0, v3

    if-nez v5, :cond_1

    return-object v2

    .line 1064
    :cond_1
    new-instance v2, Lcom/radaee/pdf/Page;

    invoke-direct {v2}, Lcom/radaee/pdf/Page;-><init>()V

    .line 1067
    iput-wide v0, v2, Lcom/radaee/pdf/Page;->hand:J

    .line 1068
    iput-object p0, v2, Lcom/radaee/pdf/Page;->m_doc:Lcom/radaee/pdf/Document;

    const/4 v0, 0x0

    .line 1069
    iput v0, v2, Lcom/radaee/pdf/Page;->pageno:I

    return-object v2
.end method

.method public GetPageCount()I
    .locals 2

    .line 1102
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->getPageCount(J)I

    move-result v0

    return v0
.end method

.method public GetPageHeight(I)F
    .locals 3

    const/high16 v0, 0x3f800000    # 1.0f

    if-ltz p1, :cond_2

    .line 1122
    iget-wide v1, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v1, v2}, Lcom/radaee/pdf/Document;->getPageCount(J)I

    move-result v1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 1123
    :cond_0
    iget-wide v1, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v1, v2, p1}, Lcom/radaee/pdf/Document;->getPageHeight(JI)F

    move-result p1

    const/4 v1, 0x0

    cmpg-float v1, p1, v1

    if-gtz v1, :cond_1

    return v0

    :cond_1
    return p1

    :cond_2
    :goto_0
    return v0
.end method

.method public GetPageLabel(I)Ljava/lang/String;
    .locals 2

    .line 1142
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->getPageLabel(JI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public GetPageWidth(I)F
    .locals 2

    .line 1111
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->getPageWidth(JI)F

    move-result p1

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    const/high16 p1, 0x3f800000    # 1.0f

    :cond_0
    return p1
.end method

.method public GetPagesMaxSize()[F
    .locals 2

    .line 1151
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->getPagesMaxSize(J)[F

    move-result-object v0

    return-object v0
.end method

.method public GetPerm()I
    .locals 2

    .line 1023
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->getPerm(J)I

    move-result v0

    return v0
.end method

.method public GetPermission()I
    .locals 2

    .line 1010
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->getPermission(J)I

    move-result v0

    return v0
.end method

.method public GetXMP()Ljava/lang/String;
    .locals 2

    .line 1169
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->getXMP(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public ImportStart(Lcom/radaee/pdf/Document;)Lcom/radaee/pdf/Document$ImportContext;
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 1314
    :cond_0
    iget-wide v1, p0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v3, p1, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v1, v2, v3, v4}, Lcom/radaee/pdf/Document;->importStart(JJ)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-eqz p1, :cond_1

    .line 1315
    new-instance p1, Lcom/radaee/pdf/Document$ImportContext;

    invoke-direct {p1, p0, v1, v2}, Lcom/radaee/pdf/Document$ImportContext;-><init>(Lcom/radaee/pdf/Document;J)V

    return-object p1

    :cond_1
    return-object v0
.end method

.method public IsEncrypted()Z
    .locals 2

    .line 1290
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->isEncrypted(J)Z

    move-result v0

    return v0
.end method

.method public IsOpened()Z
    .locals 5

    .line 654
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public MovePage(II)Z
    .locals 2

    .line 1361
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Document;->movePage(JII)Z

    move-result p1

    return p1
.end method

.method public NewFontCID(Ljava/lang/String;I)Lcom/radaee/pdf/Document$DocFont;
    .locals 3

    .line 1378
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Document;->newFontCID(JLjava/lang/String;I)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-eqz v2, :cond_0

    .line 1381
    new-instance v0, Lcom/radaee/pdf/Document$DocFont;

    invoke-direct {v0}, Lcom/radaee/pdf/Document$DocFont;-><init>()V

    .line 1382
    iput-wide p1, v0, Lcom/radaee/pdf/Document$DocFont;->hand:J

    .line 1383
    iput-object p0, v0, Lcom/radaee/pdf/Document$DocFont;->doc:Lcom/radaee/pdf/Document;

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public NewForm()Lcom/radaee/pdf/Document$DocForm;
    .locals 5

    .line 1507
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->newForm(J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 1509
    :cond_0
    new-instance v2, Lcom/radaee/pdf/Document$DocForm;

    invoke-direct {v2}, Lcom/radaee/pdf/Document$DocForm;-><init>()V

    .line 1510
    iput-wide v0, v2, Lcom/radaee/pdf/Document$DocForm;->hand:J

    .line 1511
    iput-object p0, v2, Lcom/radaee/pdf/Document$DocForm;->m_doc:Lcom/radaee/pdf/Document;

    return-object v2
.end method

.method public NewGState()Lcom/radaee/pdf/Document$DocGState;
    .locals 5

    .line 1395
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->newGState(J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 1398
    new-instance v2, Lcom/radaee/pdf/Document$DocGState;

    invoke-direct {v2}, Lcom/radaee/pdf/Document$DocGState;-><init>()V

    .line 1399
    iput-wide v0, v2, Lcom/radaee/pdf/Document$DocGState;->hand:J

    .line 1400
    iput-object p0, v2, Lcom/radaee/pdf/Document$DocGState;->doc:Lcom/radaee/pdf/Document;

    return-object v2

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public NewImage(Landroid/graphics/Bitmap;I)Lcom/radaee/pdf/Document$DocImage;
    .locals 3

    .line 1432
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Document;->newImage2(JLandroid/graphics/Bitmap;I)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-eqz v2, :cond_0

    .line 1435
    new-instance v0, Lcom/radaee/pdf/Document$DocImage;

    invoke-direct {v0}, Lcom/radaee/pdf/Document$DocImage;-><init>()V

    .line 1436
    iput-wide p1, v0, Lcom/radaee/pdf/Document$DocImage;->hand:J

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public NewImage(Landroid/graphics/Bitmap;Z)Lcom/radaee/pdf/Document$DocImage;
    .locals 3

    .line 1413
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Document;->newImage(JLandroid/graphics/Bitmap;Z)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-eqz v2, :cond_0

    .line 1416
    new-instance v0, Lcom/radaee/pdf/Document$DocImage;

    invoke-direct {v0}, Lcom/radaee/pdf/Document$DocImage;-><init>()V

    .line 1417
    iput-wide p1, v0, Lcom/radaee/pdf/Document$DocImage;->hand:J

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public NewImageByMem([BI)Lcom/radaee/pdf/Document$DocImage;
    .locals 3

    .line 1474
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Document;->newImageJPEGByArray(J[BI)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-eqz v2, :cond_0

    .line 1477
    new-instance v0, Lcom/radaee/pdf/Document$DocImage;

    invoke-direct {v0}, Lcom/radaee/pdf/Document$DocImage;-><init>()V

    .line 1478
    iput-wide p1, v0, Lcom/radaee/pdf/Document$DocImage;->hand:J

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public NewImageJPEG(Ljava/lang/String;)Lcom/radaee/pdf/Document$DocImage;
    .locals 4

    .line 1452
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->newImageJPEG(JLjava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_0

    .line 1455
    new-instance p1, Lcom/radaee/pdf/Document$DocImage;

    invoke-direct {p1}, Lcom/radaee/pdf/Document$DocImage;-><init>()V

    .line 1456
    iput-wide v0, p1, Lcom/radaee/pdf/Document$DocImage;->hand:J

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public NewImageJPX(Ljava/lang/String;)Lcom/radaee/pdf/Document$DocImage;
    .locals 4

    .line 1490
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->newImageJPX(JLjava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_0

    .line 1493
    new-instance p1, Lcom/radaee/pdf/Document$DocImage;

    invoke-direct {p1}, Lcom/radaee/pdf/Document$DocImage;-><init>()V

    .line 1494
    iput-wide v0, p1, Lcom/radaee/pdf/Document$DocImage;->hand:J

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public NewPage(IFF)Lcom/radaee/pdf/Page;
    .locals 3

    .line 1330
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/radaee/pdf/Document;->newPage(JIFF)J

    move-result-wide p2

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-eqz v2, :cond_0

    .line 1334
    new-instance v0, Lcom/radaee/pdf/Page;

    invoke-direct {v0}, Lcom/radaee/pdf/Page;-><init>()V

    .line 1335
    iput-wide p2, v0, Lcom/radaee/pdf/Page;->hand:J

    .line 1336
    iput p1, v0, Lcom/radaee/pdf/Page;->pageno:I

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public NewRootOutline(Ljava/lang/String;IF)Z
    .locals 7

    .line 1302
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const-wide/16 v2, 0x0

    move-object v4, p1

    move v5, p2

    move v6, p3

    invoke-static/range {v0 .. v6}, Lcom/radaee/pdf/Document;->addOutlineChild(JJLjava/lang/String;IF)Z

    move-result p1

    return p1
.end method

.method public Open(Ljava/lang/String;Ljava/lang/String;)I
    .locals 6

    .line 743
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    const-wide/16 v0, -0xa

    .line 747
    :try_start_0
    invoke-static {p1, p2}, Lcom/radaee/pdf/Document;->open(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/radaee/pdf/Document;->hand_val:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 751
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 752
    iput-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    .line 754
    :goto_0
    iget-wide p1, p0, Lcom/radaee/pdf/Document;->hand_val:J

    cmp-long v5, p1, v3

    if-gtz v5, :cond_0

    cmp-long v5, p1, v0

    if-ltz v5, :cond_0

    long-to-int v2, p1

    .line 757
    iput-wide v3, p0, Lcom/radaee/pdf/Document;->hand_val:J

    :cond_0
    return v2
.end method

.method public Open(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 6

    .line 774
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    const-wide/16 v0, -0xa

    .line 778
    :try_start_0
    invoke-static {p1, p2, p3}, Lcom/radaee/pdf/Document;->openWithCert(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/radaee/pdf/Document;->hand_val:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 782
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 783
    iput-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    .line 785
    :goto_0
    iget-wide p1, p0, Lcom/radaee/pdf/Document;->hand_val:J

    cmp-long p3, p1, v3

    if-gtz p3, :cond_0

    cmp-long p3, p1, v0

    if-ltz p3, :cond_0

    long-to-int v2, p1

    .line 788
    iput-wide v3, p0, Lcom/radaee/pdf/Document;->hand_val:J

    :cond_0
    return v2
.end method

.method public OpenMem([BLjava/lang/String;)I
    .locals 6

    .line 809
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    const-wide/16 v0, -0xa

    .line 813
    :try_start_0
    invoke-static {p1, p2}, Lcom/radaee/pdf/Document;->openMem([BLjava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/radaee/pdf/Document;->hand_val:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 817
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 818
    iput-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    .line 820
    :goto_0
    iget-wide p1, p0, Lcom/radaee/pdf/Document;->hand_val:J

    cmp-long v5, p1, v3

    if-gtz v5, :cond_0

    cmp-long v5, p1, v0

    if-ltz v5, :cond_0

    long-to-int v2, p1

    .line 823
    iput-wide v3, p0, Lcom/radaee/pdf/Document;->hand_val:J

    :cond_0
    return v2
.end method

.method public OpenMem([BLjava/lang/String;Ljava/lang/String;)I
    .locals 6

    .line 839
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    const-wide/16 v0, -0xa

    .line 843
    :try_start_0
    invoke-static {p1, p2, p3}, Lcom/radaee/pdf/Document;->openMemWithCert([BLjava/lang/String;Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/radaee/pdf/Document;->hand_val:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 847
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 848
    iput-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    .line 850
    :goto_0
    iget-wide p1, p0, Lcom/radaee/pdf/Document;->hand_val:J

    cmp-long p3, p1, v3

    if-gtz p3, :cond_0

    cmp-long p3, p1, v0

    if-ltz p3, :cond_0

    long-to-int v2, p1

    .line 853
    iput-wide v3, p0, Lcom/radaee/pdf/Document;->hand_val:J

    :cond_0
    return v2
.end method

.method public OpenStream(Lcom/radaee/pdf/Document$PDFStream;Ljava/lang/String;)I
    .locals 6

    .line 874
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    .line 878
    :try_start_0
    invoke-static {p1, p2}, Lcom/radaee/pdf/Document;->openStream(Lcom/radaee/pdf/Document$PDFStream;Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/radaee/pdf/Document;->hand_val:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 881
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 883
    :goto_0
    iget-wide p1, p0, Lcom/radaee/pdf/Document;->hand_val:J

    cmp-long v0, p1, v3

    if-gtz v0, :cond_0

    const-wide/16 v0, -0xa

    cmp-long v5, p1, v0

    if-ltz v5, :cond_0

    long-to-int v2, p1

    .line 886
    iput-wide v3, p0, Lcom/radaee/pdf/Document;->hand_val:J

    :cond_0
    return v2
.end method

.method public OpenStream(Lcom/radaee/pdf/Document$PDFStream;Ljava/lang/String;Ljava/lang/String;)I
    .locals 6

    .line 895
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    .line 899
    :try_start_0
    invoke-static {p1, p2, p3}, Lcom/radaee/pdf/Document;->openStreamWithCert(Lcom/radaee/pdf/Document$PDFStream;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/radaee/pdf/Document;->hand_val:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 902
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 904
    :goto_0
    iget-wide p1, p0, Lcom/radaee/pdf/Document;->hand_val:J

    cmp-long p3, p1, v3

    if-gtz p3, :cond_0

    const-wide/16 v0, -0xa

    cmp-long p3, p1, v0

    if-ltz p3, :cond_0

    long-to-int v2, p1

    .line 907
    iput-wide v3, p0, Lcom/radaee/pdf/Document;->hand_val:J

    :cond_0
    return v2
.end method

.method public RemovePage(I)Z
    .locals 2

    .line 1350
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->removePage(JI)Z

    move-result p1

    return p1
.end method

.method public RunJS(Ljava/lang/String;Lcom/radaee/pdf/Document$PDFJSDelegate;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 924
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Document;->runJS(JLjava/lang/String;Lcom/radaee/pdf/Document$PDFJSDelegate;)Z

    move-result p1

    return p1
.end method

.method public Save()Z
    .locals 2

    .line 1231
    :try_start_0
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Document;->save(J)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    .line 1235
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    return v0
.end method

.method public SaveAs(Ljava/lang/String;Z)Z
    .locals 2

    .line 1249
    :try_start_0
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Document;->saveAs(JLjava/lang/String;Z)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 1253
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p1, 0x0

    return p1
.end method

.method public SetCache(Ljava/lang/String;)Z
    .locals 2

    .line 704
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->setCache(JLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public SetFontDel(Lcom/radaee/pdf/Document$PDFFontDelegate;)V
    .locals 2

    .line 713
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->setFontDel(JLcom/radaee/pdf/Document$PDFFontDelegate;)V

    return-void
.end method

.method public SetMeta(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 1200
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Document;->setMeta(JLjava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public SetPageRotate(II)Z
    .locals 2

    .line 1537
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Document;->setPageRotate(JII)Z

    move-result p1

    return p1
.end method

.method public SetXMP(Ljava/lang/String;)Z
    .locals 2

    .line 1180
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Document;->setXMP(JLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public VerifySign(Lcom/radaee/pdf/Sign;)I
    .locals 4

    .line 1548
    iget-wide v0, p0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p1, Lcom/radaee/pdf/Sign;->m_hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->verifySign(JJ)I

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

    .line 1575
    invoke-virtual {p0}, Lcom/radaee/pdf/Document;->Close()V

    .line 1576
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
