.class Lcom/flyersoft/components/cloud/webdav/http/WHttp$SingletonHelper;
.super Ljava/lang/Object;
.source "WHttp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/cloud/webdav/http/WHttp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SingletonHelper"
.end annotation


# static fields
.field private static final INSTANCE:Lcom/flyersoft/components/cloud/webdav/http/WHttp;


# direct methods
.method static bridge synthetic -$$Nest$sfgetINSTANCE()Lcom/flyersoft/components/cloud/webdav/http/WHttp;
    .locals 1

    sget-object v0, Lcom/flyersoft/components/cloud/webdav/http/WHttp$SingletonHelper;->INSTANCE:Lcom/flyersoft/components/cloud/webdav/http/WHttp;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 60
    new-instance v0, Lcom/flyersoft/components/cloud/webdav/http/WHttp;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/flyersoft/components/cloud/webdav/http/WHttp;-><init>(Lcom/flyersoft/components/cloud/webdav/http/WHttp-IA;)V

    sput-object v0, Lcom/flyersoft/components/cloud/webdav/http/WHttp$SingletonHelper;->INSTANCE:Lcom/flyersoft/components/cloud/webdav/http/WHttp;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
