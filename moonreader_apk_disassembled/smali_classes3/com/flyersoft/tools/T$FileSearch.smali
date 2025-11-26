.class public Lcom/flyersoft/tools/T$FileSearch;
.super Ljava/lang/Object;
.source "T.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/T;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileSearch"
.end annotation


# instance fields
.field public list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1146
    iput-object p1, p0, Lcom/flyersoft/tools/T$FileSearch;->path:Ljava/lang/String;

    .line 1147
    iput-object p2, p0, Lcom/flyersoft/tools/T$FileSearch;->list:Ljava/util/ArrayList;

    return-void
.end method
