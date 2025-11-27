.class public final Lcom/dropbox/core/v1/DbxUrlWithExpiration;
.super Ljava/lang/Object;
.source "DbxUrlWithExpiration.java"


# static fields
.field public static final Reader:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "Lcom/dropbox/core/v1/DbxUrlWithExpiration;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final expires:Ljava/util/Date;

.field public final url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 24
    new-instance v0, Lcom/dropbox/core/v1/DbxUrlWithExpiration$1;

    invoke-direct {v0}, Lcom/dropbox/core/v1/DbxUrlWithExpiration$1;-><init>()V

    sput-object v0, Lcom/dropbox/core/v1/DbxUrlWithExpiration;->Reader:Lcom/dropbox/core/json/JsonReader;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Date;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxUrlWithExpiration;->url:Ljava/lang/String;

    .line 21
    iput-object p2, p0, Lcom/dropbox/core/v1/DbxUrlWithExpiration;->expires:Ljava/util/Date;

    return-void
.end method
