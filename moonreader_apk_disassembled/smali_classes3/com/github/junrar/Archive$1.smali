.class Lcom/github/junrar/Archive$1;
.super Ljava/lang/Object;
.source "Archive.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/junrar/Archive;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/github/junrar/rarfile/FileHeader;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/junrar/Archive;


# direct methods
.method constructor <init>(Lcom/github/junrar/Archive;)V
    .locals 0

    .line 653
    iput-object p1, p0, Lcom/github/junrar/Archive$1;->this$0:Lcom/github/junrar/Archive;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 668
    iget-object v0, p0, Lcom/github/junrar/Archive$1;->this$0:Lcom/github/junrar/Archive;

    invoke-virtual {v0}, Lcom/github/junrar/Archive;->nextFileHeader()Lcom/github/junrar/rarfile/FileHeader;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/github/junrar/Archive;->access$002(Lcom/github/junrar/Archive;Lcom/github/junrar/rarfile/FileHeader;)Lcom/github/junrar/rarfile/FileHeader;

    .line 669
    iget-object v0, p0, Lcom/github/junrar/Archive$1;->this$0:Lcom/github/junrar/Archive;

    invoke-static {v0}, Lcom/github/junrar/Archive;->access$000(Lcom/github/junrar/Archive;)Lcom/github/junrar/rarfile/FileHeader;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public next()Lcom/github/junrar/rarfile/FileHeader;
    .locals 1

    .line 658
    iget-object v0, p0, Lcom/github/junrar/Archive$1;->this$0:Lcom/github/junrar/Archive;

    invoke-static {v0}, Lcom/github/junrar/Archive;->access$000(Lcom/github/junrar/Archive;)Lcom/github/junrar/rarfile/FileHeader;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 659
    iget-object v0, p0, Lcom/github/junrar/Archive$1;->this$0:Lcom/github/junrar/Archive;

    invoke-static {v0}, Lcom/github/junrar/Archive;->access$000(Lcom/github/junrar/Archive;)Lcom/github/junrar/rarfile/FileHeader;

    move-result-object v0

    return-object v0

    .line 661
    :cond_0
    iget-object v0, p0, Lcom/github/junrar/Archive$1;->this$0:Lcom/github/junrar/Archive;

    invoke-virtual {v0}, Lcom/github/junrar/Archive;->nextFileHeader()Lcom/github/junrar/rarfile/FileHeader;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 653
    invoke-virtual {p0}, Lcom/github/junrar/Archive$1;->next()Lcom/github/junrar/rarfile/FileHeader;

    move-result-object v0

    return-object v0
.end method
