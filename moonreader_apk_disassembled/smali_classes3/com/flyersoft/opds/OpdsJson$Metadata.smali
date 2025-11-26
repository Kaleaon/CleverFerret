.class Lcom/flyersoft/opds/OpdsJson$Metadata;
.super Ljava/lang/Object;
.source "OpdsJson.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/opds/OpdsJson;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Metadata"
.end annotation


# instance fields
.field public author:Lcom/flyersoft/opds/OpdsJson$Item;

.field public currentPage:I

.field public description:Ljava/lang/String;

.field public itemsPerPage:I

.field public language:Ljava/lang/String;

.field public modified:Ljava/lang/String;

.field public numberOfItems:I

.field public publisher:Ljava/lang/String;

.field final synthetic this$0:Lcom/flyersoft/opds/OpdsJson;

.field public title:Ljava/lang/String;

.field public translator:Ljava/lang/String;

.field public type:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/opds/OpdsJson;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 40
    iput-object p1, p0, Lcom/flyersoft/opds/OpdsJson$Metadata;->this$0:Lcom/flyersoft/opds/OpdsJson;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
