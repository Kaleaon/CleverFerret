.class public Lcom/flyersoft/components/Readwise$WiseItem;
.super Ljava/lang/Object;
.source "Readwise.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/Readwise;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WiseItem"
.end annotation


# instance fields
.field public author:Ljava/lang/String;

.field public chapter:Ljava/lang/String;

.field public note:Ljava/lang/String;

.field public text:Ljava/lang/String;

.field public title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/flyersoft/components/Readwise$WiseItem;->title:Ljava/lang/String;

    .line 38
    iput-object p2, p0, Lcom/flyersoft/components/Readwise$WiseItem;->author:Ljava/lang/String;

    .line 39
    iput-object p3, p0, Lcom/flyersoft/components/Readwise$WiseItem;->text:Ljava/lang/String;

    .line 40
    iput-object p4, p0, Lcom/flyersoft/components/Readwise$WiseItem;->note:Ljava/lang/String;

    .line 41
    iput-object p5, p0, Lcom/flyersoft/components/Readwise$WiseItem;->chapter:Ljava/lang/String;

    return-void
.end method
