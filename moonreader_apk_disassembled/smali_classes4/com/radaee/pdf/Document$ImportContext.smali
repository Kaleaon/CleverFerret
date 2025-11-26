.class public Lcom/radaee/pdf/Document$ImportContext;
.super Ljava/lang/Object;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/pdf/Document;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImportContext"
.end annotation


# instance fields
.field protected hand:J

.field protected m_doc:Lcom/radaee/pdf/Document;


# direct methods
.method protected constructor <init>(Lcom/radaee/pdf/Document;J)V
    .locals 0

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    iput-wide p2, p0, Lcom/radaee/pdf/Document$ImportContext;->hand:J

    .line 127
    iput-object p1, p0, Lcom/radaee/pdf/Document$ImportContext;->m_doc:Lcom/radaee/pdf/Document;

    return-void
.end method


# virtual methods
.method public Destroy()V
    .locals 4

    .line 147
    iget-object v0, p0, Lcom/radaee/pdf/Document$ImportContext;->m_doc:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$ImportContext;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->access$100(JJ)V

    const-wide/16 v0, 0x0

    .line 148
    iput-wide v0, p0, Lcom/radaee/pdf/Document$ImportContext;->hand:J

    return-void
.end method

.method public ImportPage(II)Z
    .locals 7

    .line 139
    iget-wide v0, p0, Lcom/radaee/pdf/Document$ImportContext;->hand:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 p1, 0x0

    return p1

    .line 140
    :cond_0
    iget-object v0, p0, Lcom/radaee/pdf/Document$ImportContext;->m_doc:Lcom/radaee/pdf/Document;

    iget-wide v1, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v3, p0, Lcom/radaee/pdf/Document$ImportContext;->hand:J

    move v5, p1

    move v6, p2

    invoke-static/range {v1 .. v6}, Lcom/radaee/pdf/Document;->access$000(JJII)Z

    move-result p1

    return p1
.end method
