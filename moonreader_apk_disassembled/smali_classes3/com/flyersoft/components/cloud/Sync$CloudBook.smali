.class public Lcom/flyersoft/components/cloud/Sync$CloudBook;
.super Ljava/lang/Object;
.source "Sync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/cloud/Sync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CloudBook"
.end annotation


# instance fields
.field public addTime:Ljava/lang/String;

.field public author:Ljava/lang/String;

.field public bookName:Ljava/lang/String;

.field public category:Ljava/lang/String;

.field public description:Ljava/lang/String;

.field public deviceId:Ljava/lang/String;

.field public downloadUrl:Ljava/lang/String;

.field public favorite:Ljava/lang/String;

.field public filename:Ljava/lang/String;

.field public groupBooks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public groupName:Ljava/lang/String;

.field public rate:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1344
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1348
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/cloud/Sync$CloudBook;->groupBooks:Ljava/util/ArrayList;

    return-void
.end method
