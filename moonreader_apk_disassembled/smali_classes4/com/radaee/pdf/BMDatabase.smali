.class public Lcom/radaee/pdf/BMDatabase;
.super Ljava/lang/Object;
.source "BMDatabase.java"


# instance fields
.field private m_hand:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 19
    iput-wide v0, p0, Lcom/radaee/pdf/BMDatabase;->m_hand:J

    return-void
.end method

.method private static native close(J)V
.end method

.method private static native openAndCreate(Ljava/lang/String;)J
.end method

.method private static native recClose(J)V
.end method

.method private static native recGetCount(J)I
.end method

.method private static native recItemGetName(JI)Ljava/lang/String;
.end method

.method private static native recItemGetPage(JI)I
.end method

.method private static native recItemInsert(JLjava/lang/String;I)Z
.end method

.method private static native recItemRemove(JI)Z
.end method

.method private static native recOpen(JLjava/lang/String;)J
.end method


# virtual methods
.method public Close()V
    .locals 2

    .line 35
    iget-wide v0, p0, Lcom/radaee/pdf/BMDatabase;->m_hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/BMDatabase;->close(J)V

    const-wide/16 v0, 0x0

    .line 36
    iput-wide v0, p0, Lcom/radaee/pdf/BMDatabase;->m_hand:J

    return-void
.end method

.method public OpenOrCreate(Ljava/lang/String;)Z
    .locals 4

    .line 27
    invoke-static {p1}, Lcom/radaee/pdf/BMDatabase;->openAndCreate(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/radaee/pdf/BMDatabase;->m_hand:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public RecClose(J)V
    .locals 0

    .line 53
    invoke-static {p1, p2}, Lcom/radaee/pdf/BMDatabase;->recClose(J)V

    return-void
.end method

.method public RecGetCount(J)I
    .locals 0

    .line 62
    invoke-static {p1, p2}, Lcom/radaee/pdf/BMDatabase;->recGetCount(J)I

    move-result p1

    return p1
.end method

.method public RecItemGetName(JI)Ljava/lang/String;
    .locals 0

    .line 72
    invoke-static {p1, p2, p3}, Lcom/radaee/pdf/BMDatabase;->recItemGetName(JI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public RecItemGetPage(JI)I
    .locals 0

    .line 82
    invoke-static {p1, p2, p3}, Lcom/radaee/pdf/BMDatabase;->recItemGetPage(JI)I

    move-result p1

    return p1
.end method

.method public RecItemInsert(JLjava/lang/String;I)Z
    .locals 0

    .line 103
    invoke-static {p1, p2, p3, p4}, Lcom/radaee/pdf/BMDatabase;->recItemInsert(JLjava/lang/String;I)Z

    move-result p1

    return p1
.end method

.method public RecItemRemove(JI)Z
    .locals 0

    .line 92
    invoke-static {p1, p2, p3}, Lcom/radaee/pdf/BMDatabase;->recItemRemove(JI)Z

    move-result p1

    return p1
.end method

.method public RecOpen(Ljava/lang/String;)J
    .locals 2

    .line 45
    iget-wide v0, p0, Lcom/radaee/pdf/BMDatabase;->m_hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/BMDatabase;->recOpen(JLjava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 108
    invoke-virtual {p0}, Lcom/radaee/pdf/BMDatabase;->Close()V

    .line 109
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
