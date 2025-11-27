.class final Lcom/dropbox/core/v1/DbxClientV1$CopyRef;
.super Ljava/lang/Object;
.source "DbxClientV1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v1/DbxClientV1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CopyRef"
.end annotation


# static fields
.field public static final Reader:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "Lcom/dropbox/core/v1/DbxClientV1$CopyRef;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final expires:Ljava/util/Date;

.field public final id:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 2020
    new-instance v0, Lcom/dropbox/core/v1/DbxClientV1$CopyRef$1;

    invoke-direct {v0}, Lcom/dropbox/core/v1/DbxClientV1$CopyRef$1;-><init>()V

    sput-object v0, Lcom/dropbox/core/v1/DbxClientV1$CopyRef;->Reader:Lcom/dropbox/core/json/JsonReader;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/util/Date;)V
    .locals 0

    .line 2015
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2016
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1$CopyRef;->id:Ljava/lang/String;

    .line 2017
    iput-object p2, p0, Lcom/dropbox/core/v1/DbxClientV1$CopyRef;->expires:Ljava/util/Date;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/util/Date;Lcom/dropbox/core/v1/DbxClientV1$1;)V
    .locals 0

    .line 2009
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/v1/DbxClientV1$CopyRef;-><init>(Ljava/lang/String;Ljava/util/Date;)V

    return-void
.end method
