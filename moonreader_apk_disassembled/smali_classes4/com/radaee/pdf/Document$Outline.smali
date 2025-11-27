.class public Lcom/radaee/pdf/Document$Outline;
.super Ljava/lang/Object;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/pdf/Document;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Outline"
.end annotation


# instance fields
.field protected hand:J

.field final synthetic this$0:Lcom/radaee/pdf/Document;


# direct methods
.method public constructor <init>(Lcom/radaee/pdf/Document;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 153
    iput-object p1, p0, Lcom/radaee/pdf/Document$Outline;->this$0:Lcom/radaee/pdf/Document;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public AddChild(Ljava/lang/String;IF)Z
    .locals 8

    .line 244
    iget-object v0, p0, Lcom/radaee/pdf/Document$Outline;->this$0:Lcom/radaee/pdf/Document;

    iget-wide v1, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v3, p0, Lcom/radaee/pdf/Document$Outline;->hand:J

    move-object v5, p1

    move v6, p2

    move v7, p3

    invoke-static/range {v1 .. v7}, Lcom/radaee/pdf/Document;->access$1000(JJLjava/lang/String;IF)Z

    move-result p1

    return p1
.end method

.method public AddNext(Ljava/lang/String;IF)Z
    .locals 8

    .line 232
    iget-object v0, p0, Lcom/radaee/pdf/Document$Outline;->this$0:Lcom/radaee/pdf/Document;

    iget-wide v1, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v3, p0, Lcom/radaee/pdf/Document$Outline;->hand:J

    move-object v5, p1

    move v6, p2

    move v7, p3

    invoke-static/range {v1 .. v7}, Lcom/radaee/pdf/Document;->access$900(JJLjava/lang/String;IF)Z

    move-result p1

    return p1
.end method

.method public GetChild()Lcom/radaee/pdf/Document$Outline;
    .locals 5

    .line 192
    iget-object v0, p0, Lcom/radaee/pdf/Document$Outline;->this$0:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$Outline;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->access$500(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 194
    :cond_0
    new-instance v2, Lcom/radaee/pdf/Document$Outline;

    iget-object v3, p0, Lcom/radaee/pdf/Document$Outline;->this$0:Lcom/radaee/pdf/Document;

    invoke-direct {v2, v3}, Lcom/radaee/pdf/Document$Outline;-><init>(Lcom/radaee/pdf/Document;)V

    .line 195
    iput-wide v0, v2, Lcom/radaee/pdf/Document$Outline;->hand:J

    return-object v2
.end method

.method public GetDest()I
    .locals 4

    .line 204
    iget-object v0, p0, Lcom/radaee/pdf/Document$Outline;->this$0:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$Outline;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->access$600(JJ)I

    move-result v0

    return v0
.end method

.method public GetFileLink()Ljava/lang/String;
    .locals 4

    .line 220
    iget-object v0, p0, Lcom/radaee/pdf/Document$Outline;->this$0:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$Outline;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->access$800(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public GetNext()Lcom/radaee/pdf/Document$Outline;
    .locals 5

    .line 180
    iget-object v0, p0, Lcom/radaee/pdf/Document$Outline;->this$0:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$Outline;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->access$400(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 182
    :cond_0
    new-instance v2, Lcom/radaee/pdf/Document$Outline;

    iget-object v3, p0, Lcom/radaee/pdf/Document$Outline;->this$0:Lcom/radaee/pdf/Document;

    invoke-direct {v2, v3}, Lcom/radaee/pdf/Document$Outline;-><init>(Lcom/radaee/pdf/Document;)V

    .line 183
    iput-wide v0, v2, Lcom/radaee/pdf/Document$Outline;->hand:J

    return-object v2
.end method

.method public GetTitle()Ljava/lang/String;
    .locals 4

    .line 162
    iget-object v0, p0, Lcom/radaee/pdf/Document$Outline;->this$0:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$Outline;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->access$200(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public GetURI()Ljava/lang/String;
    .locals 4

    .line 212
    iget-object v0, p0, Lcom/radaee/pdf/Document$Outline;->this$0:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$Outline;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->access$700(JJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public RemoveFromDoc()Z
    .locals 4

    .line 254
    iget-object v0, p0, Lcom/radaee/pdf/Document$Outline;->this$0:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$Outline;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Document;->access$1100(JJ)Z

    move-result v0

    const-wide/16 v1, 0x0

    .line 255
    iput-wide v1, p0, Lcom/radaee/pdf/Document$Outline;->hand:J

    return v0
.end method

.method public SetTitle(Ljava/lang/String;)Z
    .locals 4

    .line 172
    iget-object v0, p0, Lcom/radaee/pdf/Document$Outline;->this$0:Lcom/radaee/pdf/Document;

    iget-wide v0, v0, Lcom/radaee/pdf/Document;->hand_val:J

    iget-wide v2, p0, Lcom/radaee/pdf/Document$Outline;->hand:J

    invoke-static {v0, v1, v2, v3, p1}, Lcom/radaee/pdf/Document;->access$300(JJLjava/lang/String;)Z

    move-result p1

    return p1
.end method
