.class public Lcom/dozof/app/MLoader$MItem;
.super Ljava/lang/Object;
.source "MLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dozof/app/MLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MItem"
.end annotation


# instance fields
.field private data:[B

.field public filename:Ljava/lang/String;

.field public length:I

.field public pos:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    const/4 v0, 0x0

    .line 46
    iput-object v0, p0, Lcom/dozof/app/MLoader$MItem;->data:[B

    return-void
.end method

.method public getData()[B
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/dozof/app/MLoader$MItem;->data:[B

    if-eqz v0, :cond_0

    return-object v0

    .line 38
    :cond_0
    :try_start_0
    iget v0, p0, Lcom/dozof/app/MLoader$MItem;->pos:I

    invoke-static {v0}, Lcom/dozof/app/MLoader;->-$$Nest$smgetData(I)[B

    move-result-object v0

    iput-object v0, p0, Lcom/dozof/app/MLoader$MItem;->data:[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 40
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 42
    :goto_0
    iget-object v0, p0, Lcom/dozof/app/MLoader$MItem;->data:[B

    return-object v0
.end method
